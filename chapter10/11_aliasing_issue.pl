use strict;
use warnings;
use diagnostics;
use Data::Dumper;

my @numbers     = qw /1 2 3 4 5  /;
my @incremented = map { $_ + 1 } @numbers;

print Data::Dumper->Dump(
    [ \@numbers,  \@incremented ],
    [ '*numbers', '*incremented' ],
);
