#!/usr/bin/perl
# Example 11-3   Demonstrate a recursive subroutine to list a subtree of a filesystem

use strict;
use warnings;


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
        if ($file=~ /.*\.js/i) {
			my @file_data = get_file_data("$directory/$file");
			my $file_data = join("", @file_data);
			$file_data =~ s/gallery\/albums/gallery_en\/albums/g;
			
			my $outputfile="$directory/$file";
			unless (open(OUTPUT, ">$outputfile")) {
			print "Cannot open file \"\$outputfile\" to write to !! \n\n";
			exit;
			}
			print OUTPUT $file_data;
			
        # If the directory entry is a subdirectory
        }elsif( -d "$directory/$file") {
			
            # Here is the recursive call to this subroutine
            list_recursively("$directory/$file");
        }
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
