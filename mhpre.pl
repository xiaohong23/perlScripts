use strict;
use warnings;

my @files = (  );
my $folder = '20080823';

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
my $outputfile="$file.pl";
unless (open(OUTPUT, ">$outputfile")) {
print "Cannot open file \"\$outputfile\" to write to !! \n\n";
exit;
}
print OUTPUT "#! /usr/bin/perl \n";
print OUTPUT "use strict; \n";
print OUTPUT "use warnings; \n";
print OUTPUT "my \@files = (  ); \n";
print OUTPUT "my \$folder = '$file'; \n";
print OUTPUT "unless(opendir(FOLDER, \$folder)) { \n";
print OUTPUT "print \"Cannot open folder \$folder!\\n\"; \n";
print OUTPUT "exit; \n";
print OUTPUT "} \n";
print OUTPUT "\@files = grep (!/^\\.\\.\?\$\/, readdir(FOLDER)); \n";
print OUTPUT "closedir(FOLDER); \n";
print OUTPUT 'my $length = @files;';
print OUTPUT "print  \"<!-- \\n\"; \n";
print OUTPUT "print  \"var pageNum = 1;\\n\"; \n";
print OUTPUT "print  \"var pageCount = \$length;\\n\"; \n";
print OUTPUT 'print  "var picUrl = \"http://xiaohong.t15.org/\";\n"; ';
print OUTPUT "\n";
print OUTPUT 'print  "var picDir = \"http://xiaohong.t15.org/imagevue/content/$folder/\";\n"; ';
print OUTPUT "\n";
print OUTPUT "print  \"var picSrc = new Array();\\n\"; \n";
print OUTPUT 'print  "var pageName = \"$folder\";\n";';
print OUTPUT "\n";
print OUTPUT "print  \"var picHref = new Array();\\n\"; \n";
print OUTPUT "print  \"var picAlt = new Array();\\n\"; \n";
print OUTPUT 'print  "var albumUrl = \"http://xiaohong.t15.org\";\n";';
print OUTPUT "\n";
print OUTPUT "print  \"var MM_p=new Array();\\n\"; \n";
print OUTPUT "print  \"MM_p[-1] = new Image;\\n\"; \n";
print OUTPUT "print  \"MM_p[0] = new Image;\\n\"; \n";
print OUTPUT "print  \"MM_p[1] = new Image;\\n\"; \n";
print OUTPUT "print  \"var preNum, nextNum;\\n\"; \n";
print OUTPUT "print  \"var interval = 5000;\\n\"; \n";
print OUTPUT 'print  "var oInterval = \"\";\n"; ';
print OUTPUT "\n";
print OUTPUT "print  \"var picSrc = new Array();\\n\"; \n";

print OUTPUT "my \$i=1; \n";
print OUTPUT "foreach my \$file (\@files) { \n";
print OUTPUT "if (\$file=~ /thumb/i) { \n";
print OUTPUT "next; \n";
print OUTPUT "} \n";
print OUTPUT "else { \n";
print OUTPUT "print \"picSrc[\$i] =\"; \n";
print OUTPUT "print \"\\'\$file\\'; \\n\" ; \n";
print OUTPUT "\$i++; \n";
print OUTPUT "} \n";
print OUTPUT "} \n";
print OUTPUT "exit; \n";

}

exit;

