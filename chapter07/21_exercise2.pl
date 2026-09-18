use strict;
use warnings;
use diagnostics;
use Scalar::Util 'looks_like_number';

sub average {
    my $numbers = shift;
    my ( $total, $count ) = ( 0, scalar $numbers->@* );
    foreach my $number ( $numbers->@* ) {
        if ( not looks_like_number($number) ) {
            die "the element $number is not a number\n";
        }
        else {
            $total += $number;
        }
    }
    return $total / $count;
}

my @list = ( 1, 2, 'la', 10, 10 );
print average( \@list ), "\n";
