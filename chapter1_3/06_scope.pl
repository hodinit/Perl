use strict;
use diagnostics;
use warnings;

my @numbers = (1,2,3,4,5);
for my $number (@numbers) {
    my $reciprocal = 1 / $number;
    print "the reciprocal of $number is $reciprocal\n";
}
