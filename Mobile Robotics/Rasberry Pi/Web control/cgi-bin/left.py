#!/usr/bin/python
import cgi

print "Content-type: text/html\n\n"
print "Hello moving left"

arguments = cgi.FieldStorage()
for i in arguments.keys():
 print arguments[i].value