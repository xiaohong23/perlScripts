use strict;
use warnings;


my @file_data = get_file_data("indexForYahoo.csv");
foreach my $line (@file_data) {



$line=~ s/\s+$//;
if ($line =~/^\s*$/){
next;
}
else {

print "getSymbols(\"\^$line\",src=\"yahoo\",from=\"1970-01-01\")";
print "\n";
print "$line<-as.data.frame($line)";
print "\n";
print "dbWriteTable(con, \"$line\", $line, overwrite = TRUE)";
print "\n";
print "remove($line)";
print "\n";
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


