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
s.close()
