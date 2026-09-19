package My::Number::Utilities;

use strict;
use warnings;

our $VERSION = 0.01;

sub pi () { 3.14166 }

sub is_prime {
    my $number = shift;
    return   if $number < 2;
    return 1 if $number == 2;
    foreach (2 .. int sqrt($number)) {
        return if !($number % $_);
    }
    return 1;
}

1;