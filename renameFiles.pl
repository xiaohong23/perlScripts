#! /usr/bin/perl 
use strict; 
use warnings; 
my @files = (  ); 
my $folder = '20081023'; 
unless(opendir(FOLDER, $folder)) { 
print "Cannot open folder $folder!\n"; 
exit; 
} 
@files = grep (!/^\.\.?$/, readdir(FOLDER)); 
closedir(FOLDER); 

foreach my $file (@files) { 
if ($file=~ /(002)/i) { 
$file=~ s/(002)//;
} 
else { 

next;

} 
} 
exit; 
