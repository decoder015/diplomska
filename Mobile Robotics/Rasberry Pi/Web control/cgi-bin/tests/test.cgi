#!/bin/bash
mkdir test
t='expr 1 + 2'
t1='mkdir test'
echo -e "Content-type: text/html\n\n"
echo "<h1>Hello World</h1>"
echo "<html><head><title>Bash as CGI"
echo "</title></head><body>"
echo "<h1>Hello world</h1>"
echo "Today is $(date)"
echo "<h1>General system information for host $(hostname -s)</h1>"
echo ""
echo "<h1>Memory Info</h1>"
echo "<pre> $(free -m) </pre>"
echo "<h1>Disk Info:</h1>"
echo "<pre> $(df -h) </pre>"
echo "<h1>Logged in user</h1>"
echo "<pre> $(w) </pre>"
echo "<center>Information generated on $(date)</center>"
echo "<pre> $t </pre>"
echo "</body></html>"


