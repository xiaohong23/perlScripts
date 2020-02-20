#!/usr/bin/perl -wl
 
### REWRITE THIS USING File::Find
 
use File::Basename;
use strict;
use warnings;
 
@ARGV or die "usage: $0 directory [depth]\n";
@ARGV == 2 and ($ARGV[1] > 0 or die "usage: $0 directory [depth]\n");
$main::WANT_SORTED_OUTPUT = 0;
 
my $root = shift;
my $depth = int(shift || -1);
my $indent = 0;
my ($gap,   $reg,   $dir,  $link,  $spec,  $stop, $unread) =
   ("|   ", "|---", "+-", ">---", "*---", "++", "XXX-");
 
die "$root is not a directory\n" unless -d $root;
 
recurse($root);
 
 
sub recurse {
  my $dir = shift;
 
  print basename($dir) if !$indent++;
  unless (-r $dir) {
    print " ", $gap x ($indent - 1), $unread;
  }
  else {
    local *DIR;
    opendir DIR, $dir;
    if ($main::WANT_SORTED_OUTPUT) {
      for (map $_->[0], sort { $a->[1] cmp $b->[1] } map [ $_, lc ], readdir DIR) {
        next if /^\.\.?$/;
        print " ", $gap x ($indent - 1), (prefix("$dir/$_")), $_;
        recurse("$dir/$_") if $indent != $depth and -d "$dir/$_" and !-l "$dir/$_";
      }
    }
    else {
      while (defined(local $_ = readdir DIR)) {
        next if /^\.\.?$/;
        print " ", $gap x ($indent - 1), (prefix("$dir/$_")), $_;
        recurse("$dir/$_") if $indent != $depth and -d "$dir/$_" and !-l "$dir/$_";
      }
    }
    closedir DIR;
  }
  print " ", $gap x (--$indent || 1);
}
 
 
sub prefix {
  my $file = shift;
  -l $file ? $link :
  -d $file && $indent != $depth ? $dir :
  -d _ ? $stop :
  -f _ ? $reg :
  $spec;
}