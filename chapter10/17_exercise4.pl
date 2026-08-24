use strict;
use warnings;
use diagnostics;
use Data::Dumper;

my @employees = (
    {
        first_name => 'Sally',
        last_name  => 'Jones',
        years      => 4,
        payscale   => 4,
    },
    {
        first_name => 'Abby',
        last_name  => 'Hoffman',
        years      => 1,
        payscale   => 10,
    },
    {
        first_name => 'Jack',
        last_name  => 'Johnson',
        years      => 4,
        payscale   => 5,
    },
    {
        first_name => 'Mr.',
        last_name  => 'Magnate',
        years      => 12,
        payscale   => 1,
    },
);

my @names =
  map  { $_->{first_name} . " " . $_->{last_name} }
  sort { $a->{last_name} cmp $b->{last_name} }
  grep { $_->{years} > 1 } @employees;

print Dumper( \@names );
