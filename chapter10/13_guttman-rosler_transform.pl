use strict;
use warnings;
use diagnostics;
use Data::Dumper;

my @sorted = map { substr $_, 4 }
  sort
  map { /\|(\d+)/; pack( "A4", $1 ) . $_ } <>;
