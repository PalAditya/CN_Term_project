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
            print(l)
            print('\n')
            l = sc.recv(1024)
            if 'done' in str(l):
                l = None
        f.close()
    sc.send(b'Input file received')

    generate()
    subprocess.run(["ns", "generated.tcl"])
    sc.send(b'Simulation log generated')
    subprocess.run(["java", "Analyse"])
    sc.send(b'Log analysed successfully.')
    g = open("result.txt", "rb")
    p = g.read(1024)
    while (p):
        sc.send(p)
        p = g.read(1024)
    
    sc.close()

s.close()


