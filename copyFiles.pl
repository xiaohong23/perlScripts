#! /usr/bin/perl 
 use strict; 
 use warnings; 
 use File::Copy;
 
my %file1 = (  ); 
my %file2 = (  ); 
my @files1= ( );
my @files2= ( );
my $folder1 = '20050903oc'; 
my $folder2 = '20050903';
my $folder3 = 'selected';

unless(opendir(FOLDER, $folder1)) { 
print "Cannot open folder $folder1!\n"; 
exit; 
} 

@files1 = grep (!/^\.\.?$/, readdir(FOLDER)); 
closedir(FOLDER); 

foreach my $files1 (@files1) { 
$file1{"$files1"}="$files1";

} 


unless(opendir(FOLDER, $folder2)) { 
print "Cannot open folder $folder2!\n"; 
exit; 
} 

@files2 = grep (!/^\.\.?$/, readdir(FOLDER)); 
closedir(FOLDER); 

foreach my $files2 (@files2) { 
$file2{"$files2"}="$files2";

} 

foreach my $key (keys%file1) {

if (defined $file2{"$key"}) {

my $filetobecopied = "$folder1/$key.";
my $newfile = "$folder3/$key.";
copy($filetobecopied, $newfile) or die "File cannot be copied.";
}
else { 
next;

}
}

exit; 
