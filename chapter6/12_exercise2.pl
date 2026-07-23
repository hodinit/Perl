use strict;
use warnings;

#use diagnostics;

my $all_sales = {
    monday    => { jim => [2],            mary => [ 1, 3, 7 ] },
    tuesday   => { jim => [ 3, 8 ],       mary => [ 5, 5 ] },
    wednesday => { jim => [ 7, 0 ],       mary => [3] },
    thursday  => { jim => [4],            mary => [ 5, 7, 2, 5, 2 ] },
    friday    => { jim => [ 1, 1, 5, 6 ], mary => [2] },
};

my $count = 0;
my $total = 0;

while ( my ( $day, $sale ) = each %$all_sales ) {
    if ( $day eq 'friday' ) {
        while ( my ( $employee, $individual_sale ) = each %$sale ) {
            if ( $employee eq 'jim' ) {
                for my $i ( 0 .. @$individual_sale - 1 ) {
                    $total += @$individual_sale[$i];
                    $count++;
                }
            }
        }
    }
}

print "total: $total\ncount: $count\n";
