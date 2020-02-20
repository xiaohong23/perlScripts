#! /usr/bin/perl 
use strict; 
use warnings; 
my @files = (  ); 
my $folder = 'azalea'; 
unless(opendir(FOLDER, $folder)) { 
print "Cannot open folder $folder!\n"; 
exit; 
} 
@files = grep (!/^\.\.?$/, readdir(FOLDER)); 
closedir(FOLDER); 
my $length = @files;print  "<!-- \n"; 
print  "var pageNum = 1;\n"; 
print  "var pageCount = $length;\n"; 
print  "var picUrl = \"http://www.luhui23.net/snowflake/forum/\";\n"; 
print  "var picDir = \"http://www.luhui23.net/gallery/albums/$folder/\";\n"; 
print  "var picSrc = new Array();\n"; 
print  "var pageName = \"$folder\";\n";
print  "var picHref = new Array();\n"; 
print  "var picAlt = new Array();\n"; 
print  "var albumUrl = \"http://www.luhui23.net/snowflake/forum\";\n";
print  "var MM_p=new Array();\n"; 
print  "MM_p[-1] = new Image;\n"; 
print  "MM_p[0] = new Image;\n"; 
print  "MM_p[1] = new Image;\n"; 
print  "var preNum, nextNum;\n"; 
print  "var interval = 5000;\n"; 
print  "var oInterval = \"\";\n"; 
print  "var picSrc = new Array();\n"; 
my $i=1; 
foreach my $file (@files) { 
if ($file=~ /thumb/i) { 
next; 
} 
else { 
print "picSrc[$i] ="; 
print "\'$file\'; \n" ; 
$i++; 
} 
} 
exit; 
