

my @file_data = ();
my @file_data2 = ();

@file_data = get_file_data("utf8.txt");
@file_data2 = get_file_data("templates.lang.php");


sub get_file_data {
my ($filename)=@_;
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
print @file_data;
	foreach  $line2 (@file_data2) {
	foreach  $test (@file_data) {
	print $test;
if ($line2 =~ /$test/) {
	print "$test \n";
	print "$line2 \n";
	}

	}
	}





