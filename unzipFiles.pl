#!/usr/bin/perl
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


foreach my $file (@files) {

    # If the folder entry is a regular file
    if (-d "$folder/$file") {
        next;

    # If the folder entry is a subfolder
    }elsif( -f "$folder/$file") {

        my $file = "$folder/$file";
		print "unzip $file";
		print " \t && \n";
		print "rm $file";
		print " \t && \n";
		       
    }
}

exit;
