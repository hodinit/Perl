package Convert::Distance::Metric;

use strict;
use warnings;
use diagnostics;

use base 'Exporter';
our @EXPORT_OK = qw /
  kilometers_to_meters
  meters_to_kilometers
  /;
our %EXPORT_TAGS = ( all => \@EXPORT_OK );

sub kilometers_to_meters {
    my $kilometer = shift;
    return $kilometer * 1000;
}

sub meters_to_kilometers {
    my $meter = shift;
    return $meter / 1000;
}

=pod

=head1 NAME

Convert::Distance::Metric - Convert metric units scale

=head1 SYNOPSIS

use Convert::Distance::Metric ":all";
my $km = meters_to_kilometers(1000);

=head1 DESCRIPTION

This module is used to convert different metric scales.

=head1 FUNCTION

=head2 kilometers_to_meters

Converts kilometers into meters.

=head2 meters_to_kilometers

Converts meters into kilometers.

=head1 SEEALSO

L<Convert::Distance::Imperial>

=head1 AUTHOR

Horatiu "hodinit" Lazar

=head1 LICENSE

MIT License 2026

=cut



1;
