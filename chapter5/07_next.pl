use strict;
use warnings;
use diagnostics;

my @array = ( 2, 3, 4, 5, 6, 7, 8, 9 );
my $first;

for my $number (@array) {
    my $root = sqrt($number);
    if ( int($root) != $root ) {
        next;
    }
    print "$number is perfect square\n";

}