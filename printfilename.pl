#!/usr/bin/perl
# Example 11-3   Demonstrate a recursive subroutine to list a subtree of a filesystem

use strict;
use warnings;


list_recursively('download');

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
	my $newfile;
    # Notice that we need to prepend the directory name!
    foreach my $file (@files) {
		elsif( -d "$directory/$file") {
       
			print "$directory/$file \n";
			
        # If the directory entry is a subdirectory
        }elsif( -d "$directory/$file") {
			
            # Here is the recursive call to this subroutine
            list_recursively("$directory/$file");
        }
    }
}
