#!/usr/bin/perl 
 
use strict;
use warnings;
 
 
my $dirCount=0;
my $fileCount=0;
 
my $dir='gallery';
 
countDir($dir);
 
sub countDir 
{
  my ($root) = @_;
  my @diskOjbs = <$root/*>;
  my $dirCountLoc=0;
  my $fileCountLoc=0;
 
  foreach my $item (@diskOjbs) 
  {   
    if (-d $item)
    {
      $dirCount++;
      $dirCountLoc++;
      countDir($item);
    } else
    {
      $fileCount++;
      $fileCountLoc++;
    }      
  }
  print "$dirCountLoc subdirectory(s) under folder '$root' with $fileCountLoc file(s)\n";
 
}
 
print "Total directory(s) $dirCount with file(s) $fileCount";
 
