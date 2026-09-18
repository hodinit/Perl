use strict;
use warnings;
use diagnostics;
use autodie;

my $dir = 'drafts';
my @txt = glob("$dir/*.txt");
print join "\n", @txt;
