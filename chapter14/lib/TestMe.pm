package TestMe;

use strict;
use warnings;
use Exporter::NoWork;
use DateTime;
use Carp 'croak';

sub reciprocal {
    my $number = shift;
    unless ($number) {
        croak('Illegal division by zero');
    }
    return 1 / $number;
}

sub today {
    my $today = DateTime->now->subtract( days => rand(30) );
    return sprintf "%02d/%02d/%04d" => map { $today->$_ } qw /month day year/;
}

sub unique {
    my @array = @_;
    my %hash  = map { $_ => 1 } @array;
    return keys %hash;
}

1;
