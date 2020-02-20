use File::Find;
my $some_path="gallery";

finddepth(sub { rmdir $_ if -d }, $some_path);