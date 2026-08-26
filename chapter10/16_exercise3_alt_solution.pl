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

my @new_list;

foreach my $element (@list) {
    if ( !grep { $_ eq $element } @new_list ) {
        push( @new_list, $element );
    }
}

print Dumper( \@new_list );
