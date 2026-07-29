use strict;
use warnings;
use diagnostics;

sub average {
    my $numbers = shift;
    my ( $total, $count ) = ( 0, 0 );
    foreach my $number (@$numbers) {
        $total += $number;
        $count += 1;
    }
    return $total / $count;
}

my @list = ( 1, 2, 10, 10, 10 );
print average( \@list );
