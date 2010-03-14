#!/usr/bin/perl
# play.pl - play local files by mplayer

print "Content-type: text/html\n\n";

if ($ARGV[0]) { $path = $ARGV[0] } else { $path = $ENV{QUERY_STRING} };

# unpack url
$path =~ s/\%([A-Fa-f0-9]{2})/pack('C', hex($1))/seg;

system qq{mplayer $path};
