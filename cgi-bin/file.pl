#!/usr/bin/perl
# file.pl - list local files to play 

print "Content-type: text/html\n\n";

@file = `ls /tmp/*.mp3`;

print "<ul>";
for (@file) {
chomp;

$fullname = qq{"$_"};
$fullname =~ s/([^A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg;

s/\/tmp\///;
print qq{<li><a href="#" onclick="play('$fullname')">$_</a></li>\n};
}
print "</ul>";
