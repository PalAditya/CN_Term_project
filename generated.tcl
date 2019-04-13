set ns [new Simulator]
$ns color 1 Blue 
$ns color 2 Red 
set nf [open out.nam w] 
$ns namtrace-all $nf 
set tf [open out.tr w]
$ns trace-all $tf
proc finish {} {
global ns nf tf
$ns flush-trace 
close $nf 
close $tf
exec nam out.nam & 
exit 0
}
set n0 [$ns node]
set n1 [$ns node]
set n2 [$ns node]
set n3 [$ns node]
set n4 [$ns node]
set n5 [$ns node]
Queue set limit_ 5
$ns duplex-link $n0 $n1 200Mb 10ms DropTail
$ns duplex-link-op $n0 $n1 orient right-down
set tcp [new Agent/TCP] 
$tcp set class_ 2
$ns attach-agent $n0 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n1 $sink 
$tcp set fid_ 1
set type1 [new Application/FTP] 
$type1 attach-agent $tcp 
$type1 set type_ FTP
$ns connect $tcp $sink
$ns at 0.2 "$type1 start"
$ns at 1.2 "$type1 stop"
$ns duplex-link $n0 $n2 200Mb 10ms DropTail
$ns duplex-link-op $n0 $n2 orient right-down
set tcp [new Agent/TCP] 
$tcp set class_ 2
$ns attach-agent $n0 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n2 $sink 
$tcp set fid_ 1
set type1 [new Application/FTP] 
$type1 attach-agent $tcp 
$type1 set type_ FTP
$ns connect $tcp $sink
$ns at 0.2 "$type1 start"
$ns at 1.2 "$type1 stop"
$ns duplex-link $n0 $n3 200Mb 10ms DropTail
$ns duplex-link-op $n0 $n3 orient right-down
set tcp [new Agent/TCP] 
$tcp set class_ 2
$ns attach-agent $n0 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n3 $sink 
$tcp set fid_ 1
set type1 [new Application/FTP] 
$type1 attach-agent $tcp 
$type1 set type_ FTP
$ns connect $tcp $sink
$ns at 0.2 "$type1 start"
$ns at 1.2 "$type1 stop"
$ns duplex-link $n0 $n4 200Mb 10ms DropTail
$ns duplex-link-op $n0 $n4 orient right-down
set tcp [new Agent/TCP] 
$tcp set class_ 2
$ns attach-agent $n0 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n4 $sink 
$tcp set fid_ 1
set type1 [new Application/FTP] 
$type1 attach-agent $tcp 
$type1 set type_ FTP
$ns connect $tcp $sink
$ns at 0.2 "$type1 start"
$ns at 1.2 "$type1 stop"
$ns duplex-link $n0 $n5 200Mb 10ms DropTail
$ns duplex-link-op $n0 $n5 orient right-down
set tcp [new Agent/TCP] 
$tcp set class_ 2
$ns attach-agent $n0 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n5 $sink 
$tcp set fid_ 1
set type1 [new Application/FTP] 
$type1 attach-agent $tcp 
$type1 set type_ FTP
$ns connect $tcp $sink
$ns at 0.2 "$type1 start"
$ns at 1.2 "$type1 stop"
$ns duplex-link $n1 $n2 200Mb 10ms DropTail
$ns duplex-link-op $n1 $n2 orient right-down
set tcp [new Agent/TCP] 
$tcp set class_ 2
$ns attach-agent $n1 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n2 $sink 
$tcp set fid_ 1
set type1 [new Application/FTP] 
$type1 attach-agent $tcp 
$type1 set type_ FTP
$ns connect $tcp $sink
$ns at 0.2 "$type1 start"
$ns at 1.2 "$type1 stop"
$ns duplex-link $n1 $n3 200Mb 10ms DropTail
$ns duplex-link-op $n1 $n3 orient right-down
set tcp [new Agent/TCP] 
$tcp set class_ 2
$ns attach-agent $n1 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n3 $sink 
$tcp set fid_ 1
set type1 [new Application/FTP] 
$type1 attach-agent $tcp 
$type1 set type_ FTP
$ns connect $tcp $sink
$ns at 0.2 "$type1 start"
$ns at 1.2 "$type1 stop"
$ns duplex-link $n1 $n4 200Mb 10ms DropTail
$ns duplex-link-op $n1 $n4 orient right-down
set tcp [new Agent/TCP] 
$tcp set class_ 2
$ns attach-agent $n1 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n4 $sink 
$tcp set fid_ 1
set type1 [new Application/FTP] 
$type1 attach-agent $tcp 
$type1 set type_ FTP
$ns connect $tcp $sink
$ns at 0.2 "$type1 start"
$ns at 1.2 "$type1 stop"
$ns duplex-link $n1 $n5 200Mb 10ms DropTail
$ns duplex-link-op $n1 $n5 orient right-down
set tcp [new Agent/TCP] 
$tcp set class_ 2
$ns attach-agent $n1 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n5 $sink 
$tcp set fid_ 1
set type1 [new Application/FTP] 
$type1 attach-agent $tcp 
$type1 set type_ FTP
$ns connect $tcp $sink
$ns at 0.2 "$type1 start"
$ns at 1.2 "$type1 stop"
$ns duplex-link $n2 $n3 200Mb 10ms DropTail
$ns duplex-link-op $n2 $n3 orient right-down
set tcp [new Agent/TCP] 
$tcp set class_ 2
$ns attach-agent $n2 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n3 $sink 
$tcp set fid_ 1
set type1 [new Application/FTP] 
$type1 attach-agent $tcp 
$type1 set type_ FTP
$ns connect $tcp $sink
$ns at 0.2 "$type1 start"
$ns at 1.2 "$type1 stop"
$ns duplex-link $n2 $n4 200Mb 10ms DropTail
$ns duplex-link-op $n2 $n4 orient right-down
set tcp [new Agent/TCP] 
$tcp set class_ 2
$ns attach-agent $n2 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n4 $sink 
$tcp set fid_ 1
set type1 [new Application/FTP] 
$type1 attach-agent $tcp 
$type1 set type_ FTP
$ns connect $tcp $sink
$ns at 0.2 "$type1 start"
$ns at 1.2 "$type1 stop"
$ns duplex-link $n2 $n5 200Mb 10ms DropTail
$ns duplex-link-op $n2 $n5 orient right-down
set tcp [new Agent/TCP] 
$tcp set class_ 2
$ns attach-agent $n2 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n5 $sink 
$tcp set fid_ 1
set type1 [new Application/FTP] 
$type1 attach-agent $tcp 
$type1 set type_ FTP
$ns connect $tcp $sink
$ns at 0.2 "$type1 start"
$ns at 1.2 "$type1 stop"
$ns duplex-link $n3 $n4 200Mb 10ms DropTail
$ns duplex-link-op $n3 $n4 orient right-down
set tcp [new Agent/TCP] 
$tcp set class_ 2
$ns attach-agent $n3 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n4 $sink 
$tcp set fid_ 1
set type1 [new Application/FTP] 
$type1 attach-agent $tcp 
$type1 set type_ FTP
$ns connect $tcp $sink
$ns at 0.2 "$type1 start"
$ns at 1.2 "$type1 stop"
$ns duplex-link $n3 $n5 200Mb 10ms DropTail
$ns duplex-link-op $n3 $n5 orient right-down
set tcp [new Agent/TCP] 
$tcp set class_ 2
$ns attach-agent $n3 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n5 $sink 
$tcp set fid_ 1
set type1 [new Application/FTP] 
$type1 attach-agent $tcp 
$type1 set type_ FTP
$ns connect $tcp $sink
$ns at 0.2 "$type1 start"
$ns at 1.2 "$type1 stop"
$ns duplex-link $n4 $n5 200Mb 10ms DropTail
$ns duplex-link-op $n4 $n5 orient right-down
set tcp [new Agent/TCP] 
$tcp set class_ 2
$ns attach-agent $n4 $tcp
set sink [new Agent/TCPSink]
$ns attach-agent $n5 $sink 
$tcp set fid_ 1
set type1 [new Application/FTP] 
$type1 attach-agent $tcp 
$type1 set type_ FTP
$ns connect $tcp $sink
$ns at 0.2 "$type1 start"
$ns at 1.2 "$type1 stop"
$ns at 5.0 "finish"
$ns run