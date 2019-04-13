'''graph format: 
Link-type (1 for simplex,2 for duplex)
Input node Output node
Bandwidth in terms of Mb then seconds
Queue type
Connection type (1 for tcp, 2 for udp)
User agent (1 for exponential, 2 for Pareto, 3 for cbr; 2 for telnet, 1 for ftp)
Start and end times
Type properties: CBR-Packet size,rate, true/false
Exponential-Packet size,Burst time, Idle time, rate
Pareto-Packet size,Burst time, Idle time, rate, shape
Telnet-Interval b/n arrival times'''
def generate():
	nodes=set()
	with open('input.txt') as f:
		for line in f:
			line=line.rstrip('\n').split(" ")
			nodes.update([int(line[1]),int(line[2])])
	with open('input.txt') as f:
		with open('generated.tcl','w') as f1:
			f1.write("set ns [new Simulator]\n");
			f1.write("$ns color 1 Blue \n$ns color 2 Red \nset nf [open out.nam w] \n$ns namtrace-all $nf \nset tf [open out.tr w]\n$ns trace-all $tf\n");
			f1.write("proc finish {} {\n")
			f1.write("global ns nf tf\n$ns flush-trace \nclose $nf \nclose $tf\nexec nam out.nam & \nexit 0\n}\n")
			for node in nodes:
				f1.write("set n"+str(node)+" [$ns node]\n")
			f1.write("Queue set limit_ 5\n")
			for line in f:
				line=line.rstrip('\n').split(" ")
				f1.write("$ns ")
				if (line[0]==str(2)):
					f1.write("duplex-link ")
				else:
					f1.write("simplex-link ");
				f1.write("$n"+line[1]+" $n"+line[2]+" "+line[3]+"Mb "+line[4]+"ms "+line[5]+"\n") 
				if(line[0]==str(2)):
					f1.write("$ns duplex-link-op $n"+line[1]+" $n"+line[2]+" orient right-down\n")
				else:
					f1.write("$ns simplex-link-op $n"+line[1]+" $n"+line[2]+" orient right-down\n")
				if (line[6]==str(1)):
					f1.write("set tcp [new Agent/TCP] \n$tcp set class_ 2\n$ns attach-agent $n"+line[1]+" $tcp\n")
					f1.write("set sink [new Agent/TCPSink]\n$ns attach-agent $n"+line[2]+" $sink \n")
					if (line[7]==str(1)):
						f1.write("$tcp set fid_ 1\nset type1 [new Application/FTP] \n$type1 attach-agent $tcp \n$type1 set type_ FTP\n$ns connect $tcp $sink\n")
					else:
						f1.write("$tcp set fid_ 1\nset type1 [new Application/Telnet] \n$type1 attach-agent $tcp \n$type1 set type_ Telnet\n$type1 set interval_ "+line[10]+"\n$ns connect $tcp $sink\n")
				else:
					f1.write("set udp [new Agent/UDP] \n$ns attach-agent $n"+line[1]+" $udp \nset null [new Agent/Null]   \n")
					f1.write("$ns attach-agent $n"+line[2]+" $null \n$ns connect $udp $null \n$udp set fid_ 2\n")
					if (line[7]==str(1)):
						f1.write("set type2 [new Application/Traffic/Exponential]\n$type2 attach-agent $udp\n$type2 set type_ Exponential\n$type2 set packet_size_ "+line[10]+"\n$type2 set burst_time_ "+line[11]+"ms\n$type2 set idle_time_ "+line[12]+"ms\n$type2 set rate_ "+line[13]+"mb\n")
					elif (line[7]==str(2)):
						f1.write("set type2 [new Application/Traffic/Pareto]\n$type2 attach-agent $udp\n$type2 set type_ Pareto\n$type2 set packet_size_ "+line[10]+"\n$type2 set burst_time_ "+line[11]+"ms\n$type2 set idle_time_ "+line[12]+"ms\n$type2 set rate_ "+line[13]+"mb\n$type2 set shape_ "+line[14]+"\n")
					elif (line[7]==str(3)):
						f1.write("set type2 [new Application/Traffic/CBR]\n$type2 attach-agent $udp\n$type2 set type_ CBR\n$type2 set packet_size_ "+line[10]+"\n$type2 set rate_ "+line[11]+"mb\n$type2 set random_ "+line[12]+"\n")
				if(line[6]==str(1)):
					f1.write("$ns at "+line[8]+" \"$type1 start\"\n$ns at "+line[9]+" \"$type1 stop\"\n");
				else:
					f1.write("$ns at "+line[8]+" \"$type2 start\"\n$ns at "+line[9]+" \"$type2 stop\"\n");
			f1.write("$ns at 5.0 \"finish\"\n$ns run");
if __name__ == "__main__": 
    generate() 