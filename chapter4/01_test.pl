use strict;
use warnings;
use diagnostics;

my @array = (1..100);
@array = grep {$_ < 7} @array;
print @array;