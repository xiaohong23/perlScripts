#! /usr/bin/perl

use strict;
use warnings;

my @files = (  );
my $folder = 'azalea';

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

print 'http://www.luhui23.net/contest/azalea';

print "/$file \n";
}

exit;

