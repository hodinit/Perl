use strict;
use warnings;

sub fibo {
    my $x = shift;
    return $x if $x == 0;
    return $x if $x == 1;
    return fibo( $x - 1 ) + fibo( $x - 2 );
}

my $n = 10;
foreach my $number ( 0 .. $n ) {
    print fibo($number), "\n";
}

#test1
#test2