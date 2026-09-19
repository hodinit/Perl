use strict;
use warnings;
use diagnostics;
use autodie;

my $filename = 'targets.txt';
open my $fh, '+<', $filename;
my @lines = sort grep { !/^\s*#/ } <$fh>;

seek $fh, 0, 0;
print $fh @lines;
truncate $fh, tell($fh);
close $fh;
