use strict;
use warnings;
use diagnostics;

my @numbers = ( [ 3, 1, 4, 9, 32 ], [ 5, 200 ], [ 22, 75, 100, -3 ], );

for my $group (@numbers) {
    my ( $total, $running_total ) = _running_total($group);
    print "Total is $total and running total is $running_total\n";
}

{
    my $running_total = 0;

    sub _running_total {
        my $numbers = shift;
        my $total   = 0;
        $total         += $_ for @$numbers;
        $running_total += $total;
        return $total, $running_total;
    }
}

