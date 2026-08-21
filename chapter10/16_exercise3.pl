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

foreach (@list) {
    my $element = $_;
    @new_list = grep { $_ eq $element } @list;
}

print Dumper(@new_list);

# my @sorted = sort { $a cmp $b } @list;

# print Dumper(\@sorted);
