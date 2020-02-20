#! /usr/bin/perl 
use strict; 
use warnings; 
my @files = (  ); 
my $folder = 'Hvol'; 


unless(opendir(FOLDER, $folder)) { 
print "Cannot open folder $folder!\n"; 
exit; 
} 
@files = grep (!/^\.\.?$/, readdir(FOLDER)); 
closedir(FOLDER); 

foreach my $file (@files) { 

my @file_data = get_file_data("Hvol/$file");
foreach my $line (@file_data) {

$line =~ s/\n//g;
my @fields = split(" ",$line);
my $symbol = $fields[0];
my $Hvol = $fields[1];

if (uc($symbol) eq "tickers") {  
$file =~ s/.txt//;

print "$file \t";
print "$Hvol \n";


}
else {
next;}
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
 
exit; 
