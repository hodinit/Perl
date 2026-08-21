use strict;
use warnings;
use diagnostics;
use Data::Dumper;

my @numbers = ( 28, 49, 1000, 4, 25, 49, 529 );

# my @perfect_squares = grep int(sqrt($_)) == sqrt($_), @numbers;
my @perfect_squares = grep { int( sqrt($_) ) == sqrt($_) } @numbers
  or die "error";
my @sorted = sort { $a <=> $b } @perfect_squares;

print Dumper( \@sorted );

