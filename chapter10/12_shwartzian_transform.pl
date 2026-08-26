use strict;
use warnings;
use diagnostics;
use Data::Dumper;

my @sorted = map { $_->[0] }
  sort { $a->[1] <=> $b->[1] }
  map { /\|(\d+)/; [ $_, $1 ] } <>;

print Dumper(@sorted);
