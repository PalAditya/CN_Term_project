import socket
import sys

s = socket.socket()
s.connect(("localhost", 8080))

filename = input('Input Topology file: ')

f = open(filename, "rb")

l = f.read(1024)
while (l):
    s.send(l)
    l = f.read(1024)

s.send(b'done')

print(s.recv(1024).decode("utf-8"))
print(s.recv(1024).decode("utf-8"))
print(s.recv(1024).decode("utf-8"))

f = open('k.txt', 'wb') 
l = 1
while(l):
    l = s.recv(1024)
    while (l):
        f.write(l)
        l = s.recv(1024)
    f.close()

s.close()


