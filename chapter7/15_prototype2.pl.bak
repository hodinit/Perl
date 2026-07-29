use strict;
use warnings;
use diagnostics;
use Data::Dumper;
$Data::Dumper::Sortkeys = 1;

sub my_lc (\%) {    ## no critic (Subroutines::ProhibitSubroutinePrototypes)
    my $hashref = shift;
    foreach my $key ( keys %$hashref ) {
        next if ref $hashref->{$key};
        $hashref->{$key} = lc $hashref->{$key};
    }
}

my $name = 'Marcus';
my %hash = (
    UPPER => 'CASE',
    Camel => 'Case',
);

my_lc %hash;
print Dumper( \%hash );
