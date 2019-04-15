import java.util.*;
import java.io.*;
class Analyse
{
	public static void main(String args[])throws IOException
	{
		Analyse obj=new Analyse();
		obj.go();
	}
	public void go()throws IOException
	{
		BufferedReader br=new BufferedReader(new FileReader("out.tr"));
		String str="";
		HashMap<Integer,Double> plusCBR=new HashMap<>();
		HashMap<Integer,Double> rCBR=new HashMap<>();
		HashMap<Integer,Double> plusTCP=new HashMap<>();
		HashMap<Integer,Double> rTCP=new HashMap<>();
		HashMap<Integer,Double> plusACK=new HashMap<>();
		HashMap<Integer,Double> rACK=new HashMap<>();
		int plus=0,drop=0;
		Long t1=System.nanoTime();
		while((str=br.readLine())!=null)
		{
			String s[]=str.split(" ");
			if(s[4].equals("cbr"))
			{
				if(s[0].equals("+")&&s[2].equals("0"))
					plusCBR.put(Integer.parseInt(s[11]),Double.parseDouble(s[1]));
				else if(s[0].equals("r")&&s[3].equals("3"))
					rCBR.put(Integer.parseInt(s[11]),Double.parseDouble(s[1]));
			}
			else if(s[4].equals("tcp"))
			{
				if(s[0].equals("+")&&s[2].equals("0")&&s[3].equals("1"))
					plusTCP.put(Integer.parseInt(s[11]),Double.parseDouble(s[1]));
				else if(s[0].equals("r")&&s[3].equals("1")&&s[2].equals("0"))
					rTCP.put(Integer.parseInt(s[11]),Double.parseDouble(s[1]));
			}
			else if(s[4].equals("ack"))
			{
				if(s[0].equals("+")&&s[2].equals("1")&&s[3].equals("0"))
					plusACK.put(Integer.parseInt(s[11]),Double.parseDouble(s[1]));
				else if(s[0].equals("r")&&s[3].equals("0")&&s[2].equals("1"))
					rACK.put(Integer.parseInt(s[11]),Double.parseDouble(s[1]));
			}
			if(s[0].equals("+"))
				plus++;
			else if(s[0].equals("d"))
				drop++;		
		}
		if(rACK.size()!=plusACK.size()||rTCP.size()+drop!=plusTCP.size()||rCBR.size()!=plusCBR.size())
		{
			/*System.out.println(":(");
			System.out.println(drop);
			System.out.println(rACK.size()+","+plusACK.size());
			System.out.println(rTCP.size()+","+plusTCP.size());
			System.out.println(rCBR.size()+","+plusCBR.size());*/
		}
		else;
			//System.out.println(":)");
		Iterator it = rCBR.entrySet().iterator();
		Iterator it2 = rTCP.entrySet().iterator();
		Iterator it3 = rACK.entrySet().iterator();
		double delayCBR=0.0,delayTCP=0.0,delayACK=0.0;
		while (it.hasNext()) 
		{
			Map.Entry pair = (Map.Entry)it.next();
			delayCBR+=((Double)pair.getValue()-plusCBR.get(pair.getKey()));
		}
		while (it2.hasNext()) 
		{
			Map.Entry pair = (Map.Entry)it2.next();
			delayTCP+=((Double)pair.getValue()-plusTCP.get(pair.getKey()));
		}
		while (it3.hasNext()) 
		{
			Map.Entry pair = (Map.Entry)it3.next();
			if(plusACK.get(pair.getKey())!=null)
			delayACK+=((Double)pair.getValue()-plusACK.get(pair.getKey()));
		}
		BufferedWriter writer = new BufferedWriter(new FileWriter("result.txt"));
		writer.write("Delay in CBR packets: "+delayCBR+"\nDelay in TCP packets: "+delayTCP+"\nDelay in ACK packets: "+delayACK+"\n");
		writer.write("Throughput in CBR packets: "+((1)/(delayCBR*1.0/rCBR.size()/(1000*1000)))+" bps\nThroughput in TCP packets: "+((1)/(delayTCP*1.0/rTCP.size()/(1040*1000)))+" bps\nThroughput in ACK packets: "+(1/(delayACK*1.0/rACK.size()/(40*1000)))+" bps\n");
		writer.write("Drop rate: "+(drop*1.0/plus)+"\n");
		writer.close();
		Long t2=System.nanoTime();
		//System.out.println("Total time is: "+(t2-t1)+ " nanoseconds or "+ ((t2-t1)*1.0/(1000*1000*1000))+" seconds");
	}
}
