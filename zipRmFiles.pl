#!/usr/bin/perl
use strict;
use warnings;

my @files = (  );
my $folder = 'g2data';

# Open the folder
unless(opendir(FOLDER, $folder)) {
    print "Cannot open folder $folder!\n";
    exit;
}

# Read the folder, ignoring special entries "." and ".."
@files = grep (!/^\.\.?$/, readdir(FOLDER));

closedir(FOLDER);


foreach my $file (@files) {

    # If the folder entry is a regular file
    if (-f "$folder/$file") {
        next;

    # If the folder entry is a subfolder
    }elsif( -d "$folder/$file") {

        my $folder = "$folder/$file";
		print "zip -r $file $file";
		print " \t &&";
		print " \t rm -rf $file";
		print " \t && \n";

       
    }
}

exit;
