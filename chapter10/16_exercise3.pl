use strict;
use warnings;
use diagnostics;
use Data::Dumper;

my @list = qw(
  bob
  sally
  Andromalius
  sally
  bob
  ned
  Andromalius
);

my $hash     = {};
my @new_list = grep { !$hash->{$_}++; } @list;

print Dumper( \@new_list );
