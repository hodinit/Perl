use strict;
use warnings;
use diagnostics;

my $filename = 'targets.txt';
open my $fh, '>>', $filename
  or die "cannot open '$filename': $!";
print $fh "Maxwell Smart|86|Definetly a spy\n";
