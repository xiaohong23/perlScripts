use strict;
use warnings;


my @file_data = get_file_data("text3.txt");
my $text=join('\n',@file_data);
my @admincp=split('#',$text);
foreach my $line(@admincp) {
print "$line \n";
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
