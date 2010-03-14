#!/usr/bin/perl
# scan.pl - scan bluetooth device by hcitool command

print "Content-type: text/html\n\n";

for (`hcitool scan`) {
next if /^Scanning/;

# get the scanning result and print <a> tag as output
@a = split(/\s+/, $_);
print qq{<h2><a href="#" onclick="list_hci('$a[1]')">$a[2]</a></h2>\n};
}
