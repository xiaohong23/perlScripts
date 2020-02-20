#!/usr/bin/perl
# Example 11-3   Demonstrate a recursive subroutine to list a subtree of a filesystem

use strict;
use warnings;
use File::Copy::Recursive;

my $folder = '2005';

list_recursively('test');

exit;

################################################################################
# Subroutine
################################################################################

# list_recursively
#
#   list the contents of a directory,
#              recursively listing the contents of any subdirectories

sub list_recursively {

    my($directory) = @_;

    my @files = (  );
    
    # Open the directory
    unless(opendir(DIRECTORY, $directory)) {
        print "Cannot open directory $directory!\n";
        exit;
    }
    
    # Read the directory, ignoring special entries "." and ".."
    #
    @files = grep (!/^\.\.?$/, readdir(DIRECTORY));
    
    closedir(DIRECTORY);
    
    # If file, print its name
    # If directory, recursively print its contents

    # Notice that we need to prepend the directory name!
    foreach my $file (@files) {
    
        # If the directory entry is a regular file
        if (-f "$directory/$file") {
		next;
        
        # If the directory entry is a subdirectory
        }elsif( -d "$directory/$file") {
		if ($file eq "selected") {
		


			my $file1="$directory/$file";
			my $file2="$folder";
			File::Copy::Recursive::dircopy $file1, $file2 or die "Copy failed: $!";		

			}
		else {
			next;}

		
			}
            # Here is the recursive call to this subroutine
            list_recursively("$directory/$file");
        }
    }

