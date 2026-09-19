use strict;
use warnings;
use diagnostics;

my $filename = 'targets.txt';
open my $fh, '+<', $filename
  or die "Cannot open $filename";

my @lines = sort grep { !/^\s*#/ } <$fh>;

seek $fh, 0, 0
  or die "cannot seek $filename";
print $fh @lines;
truncate $fh, tell($fh)
  or die "Cannot truncate '$filename'";
close $fh or die "cannot close $filename";
