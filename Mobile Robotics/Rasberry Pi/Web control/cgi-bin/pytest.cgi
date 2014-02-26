#!/usr/bin/python
# Tell the web server to expect HTML
content
print "Content-Type: text/html"
print

# Print a html hello world
print """
<html>
<head>
<title>Hello World!</title>
</head>
<body>
<h1>Hello World!</h1>
</body>
</html>
"""