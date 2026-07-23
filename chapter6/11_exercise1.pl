use strict;
use warnings;
use diagnostics;
use Data::Dumper;

my $first = [( 2, 4, 5, 9, 11 )];
my @second = @$first;

print Dumper($first, \@second);