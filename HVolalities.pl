use strict;
use warnings;


my @file_data = get_file_data("symbols.txt");
foreach my $line (@file_data) {
if ($line =~/^\s*$/){
next;
}
else {
my %$line=();
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


