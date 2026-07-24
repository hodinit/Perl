use strict;
use warnings;
use diagnostics;

sub random_die_roll{
    my (%arg_for) = @_;

    my $number_of_sides = $arg_for{number_of_sides} || 6;
    my $number_of_rolls = $arg_for{number_of_rolls} || 1;
    my $total = 0;

    for (1..$number_of_rolls) {
        $total += 1 + int(rand($number_of_sides));
    }
    return $total;
}

print random_die_roll(
    number_of_sides => 6,
    number_of_rolls => 2,
)