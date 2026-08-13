use strict;
use warnings;
use diagnostics;

my $directory;
opendir( my $dh, $directory )
  or die "cannot open $directory";

my @entries = grep { !/^\./ } readdir($dh);
closedir $dh
  or die "cannot close $directory";
