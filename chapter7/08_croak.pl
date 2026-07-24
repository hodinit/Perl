use strict;
use warnings;
use diagnostics;
use Carp 'croak';

sub reciprocal {
    my $number = shift;
    if ( 0== $number ) {
        croak "argument to reciprocal must not be 0";
    }
    return 1/$number;
}
reciprocal(0);
