use strict;
use warnings;
use diagnostics;

my %hash1 = ( foo => 1, bar => 2, baz => 3 );
my %hash2;
my $scalar1 = %hash1;
my $scalar2 = %hash2;
print "$scalar1 and $scalar2";