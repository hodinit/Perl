use strict;
use warnings;
use diagnostics;
use List::Util 'sum';

my @list = (1..5);
@list = map {$_ *2} @list;
my $sum = sum @list;
print $sum;