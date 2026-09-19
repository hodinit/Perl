package Convert::Distance::Metric;

use strict;
use warnings;
use diagnostics;

use base 'Exporter';
our @EXPORT_OK = qw / 
    kilometers_to_meters
    meters_to_kilometers
/;
our %EXPORT_TAGS = ( all=> \@EXPORT_OK );

sub kilometers_to_meters {
    my $kilometer = shift;
    return $kilometer * 1000;
}

sub meters_to_kilometers {
    my $meter = shift;
    return $meter /1000;
}

1;