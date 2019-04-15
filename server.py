import socket
import sys
from generate import generate
import subprocess

s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
s.bind(("localhost", 8080))
s.listen(10)

i = 1

while True:
    print('Waiting for new client..!')
    sc, address = s.accept()

    print('New client connected {}'.format(address))

    f = open('output.txt', 'wb') 
    i = i + 1
    l = 1
    while(l):
        l = sc.recv(1024)
        while (l):
            f.write(l)
            l = sc.recv(1024)
        f.close()


    generate()
    subprocess.run(["ns", "generated.tcl"])
    subprocess.run(["java", "Analyse"])
        
    sc.close()

s.close()
