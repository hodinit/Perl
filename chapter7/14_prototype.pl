use strict;
use warnings;
use diagnostics;

sub random_die_roll($@) {
    my ( $number_of_rolls, @number_of_sides ) = @_;
    my @results;
    foreach my $num_sides (@number_of_sides) {
         my $total = 0;
         $total += int ( 1+rand($num_sides) ) for 1.. $number_of_rolls;    
         push @results, $total;
    }
    return @results;
}

my @rolls = random_die_roll (2,6,5);
print join "\n", @rolls;