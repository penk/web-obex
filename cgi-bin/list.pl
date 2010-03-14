#!/usr/bin/perl
# list.pl - list files contained under Music directory

print "Content-type: text/html\n\n";

if ($ARGV[0]) { $mac = $ARGV[0] } else { $mac = $ENV{QUERY_STRING} };
my $path;

# get top directories list
@list = `obexftp -b $mac -l`;
for (@list) {
push (@top, $1) if /<folder name=(".*?")/ig;
}

# find if there exists "music" directory 
for $top (@top) {
	for $inner (`obexftp -b $mac -c $top -l`) {
		if ($inner =~ /<folder name=("music")/i) {
		$path = $top.'/'.$1;
		last;
		}
	}
}

# get file lists named with .mp3 
@final_list = `obexftp -b $mac -c $path -l`;
for (@final_list) {
push (@file, $1) if /<file name=(".*?\.mp3")/i;
}

for (@file) {

# pack file path
$val = $path."/".$_;
$val =~ s/([^A-Za-z0-9])/sprintf("%%%02X", ord($1))/seg;

# print output as checkbox
print qq{<input type="checkbox" name="$mac" value=$val>$_<br>\n};
}
