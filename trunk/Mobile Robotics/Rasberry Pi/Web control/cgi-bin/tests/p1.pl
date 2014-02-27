#!/usr/bin/perl
print "Content-Type: text/html\n\n";
print "Hello world";

system("mkdir test");

$res = `stat p1.pl`;
$dir = `echo test > t2`;
$run = `perl p2.pl`;

print "res: $res\n";
print "res: $dir\n";
print "res: $run\n";
