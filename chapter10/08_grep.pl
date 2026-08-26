use strict;
use warnings;
use diagnostics;

my @numbers = ( 13, 3, -2, 7, 270, 19, -3.2, 10.1 );
my @result  = sort { $a <=> $b } grep { $_ >= 10 } @numbers;
print join ', ', @result;
