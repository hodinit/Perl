use strict;
use warnings;
use diagnostics;

my @numbers = ( 1, 5, 23, 5, 6, 4 );
my $sum = 0;
for my $num (@numbers) {
    $sum += $num;
}

my $count = scalar @numbers;
print "the average is ".$sum/$count." .\n";