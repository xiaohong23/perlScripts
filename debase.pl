#! /usr/bin/perl

use strict;
use warnings;

my @files = (  );
my $folder = 'albums';

# Open the folder
unless(opendir(FOLDER, $folder)) {
    print "Cannot open folder $folder!\n";
    exit;
}

# Read the folder, ignoring special entries "." and ".."
@files = grep (!/^\.\.?$/, readdir(FOLDER));

closedir(FOLDER);
my $i=1;
foreach my $file (@files) {
my $outputfile="$file.php";
unless (open(OUTPUT, ">$outputfile")) {
print "Cannot open file \"\$outputfile\" to write to !! \n\n";
exit;
}

print OUTPUT '<pre><?php \n';

my @file_data = get_file_data("$file");
foreach my $line (@file_data) {
if ($line =~/^eval(*)$/){
print OUTPUT "echo($1) \n";
}
else {
next;
}
}

print OUTPUT '?></pre> \n';

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


}

exit;

