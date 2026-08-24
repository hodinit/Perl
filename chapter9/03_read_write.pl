use strict;
use warnings;
use diagnostics;

my $filename = 'targets.txt';
open my $fh, '<', $filename
  or die "Cannot open $filename";

my @lines = sort grep { !/^\s*#/ } <$fh>;
close $fh or die "cannot close $filename";

open $fh, '>', $filename
  or die "Cannot open $filename";
print $fh @lines;
close $fh or die "cannot close $filename";
