#!/usr/bin/perl
# get.pl - download file from bluetooth devices

print "Content-type: text/html\n\n";

if ($ARGV[0]) { $path = $ARGV[0] } else { $path = $ENV{QUERY_STRING} };

# unpack url
$path =~ s/\%([A-Fa-f0-9]{2})/pack('C', hex($1))/seg;
chop($path);

# get the file lists
($mac, @file) = split(/\+"/, $path);

# download file
chdir('/tmp');
for $file (@file) {
system "obexftp -b $mac -g \"$file\n";
}

print "Download completed\n";
