use strict;
use warnings;


my @file_data = get_file_data("symbols.txt");
foreach my $line (@file_data) {
$line =~ s/\n//g;

my @symbol_data = get_file_data("tickerhv.pl");
			my $symbol_data = join("", @symbol_data);
			$symbol_data =~ s/tickers/$line/g;
			$line=~ s|/|_|;
			my $outputfile="$line.pl";
			unless (open(OUTPUT, ">$outputfile")) {
			print "Cannot open file \"\$outputfile\" to write to !! \n\n";
			exit;
			}
			print OUTPUT $symbol_data;



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


