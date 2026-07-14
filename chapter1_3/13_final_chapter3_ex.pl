use strict;
use warnings;
use diagnostics;

my @array = ('Andrew', 'Andy', 'Kaufman');
for my $word (@array) {
    if ($word eq 'Andy') {
        print '"Andy" '
    }
    else {
        print "$word ";
    }
}
