use strict;
use warnings;
use diagnostics;

sub average {
    my $numbers = shift;
    my ( $total, $count ) = ( 0, scalar $numbers->@* );
    foreach my $number ( $numbers->@* ) {
        $total += $number;
    }
    return $total / $count;
}

my @list = ( 1, 2, 10, 10, 10 );
print average( \@list ), "\n";
