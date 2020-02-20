use strict;
use warnings;


my @file_data = get_file_data("admincp.lang.php.old");
foreach my $line (@file_data) {
if ($line =~/^\s*$/){
next;
}
else {
lcfirst $line;
print "$line";
print "\n";
}
}


sub get_file_data {
my($filename)=@_;
use strict;
use warnings;
my @filedata=();
unless( open(GET_FILE_DATA, $filename)) {
print STDERR "Cannot open file \"$filename\"\n\n";
exit;
}
@filedata=<GET_FILE_DATA>;
close GET_FILE_DATA;
return @filedata;
}
