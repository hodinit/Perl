use strict;
use warnings;
use diagnostics;

sub random_die_roll {
    my ( $number_of_sides, $number_of_rolls ) = @_;
    $number_of_sides ||= 6;
    $number_of_rolls ||= 1;
    my $total = 0;
    for ( 1 .. $number_of_rolls ) {
        $total += 1 + int( rand($number_of_sides) );
    }
    return $total;
}

my $result = random_die_roll( 6, 3 );
print $result;
