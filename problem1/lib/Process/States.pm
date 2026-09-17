package Process::States;

use strict;
use warnings;
use diagnostics;
use Exporter::NoWork;

sub process_header {
    my $header = shift;
    chomp $header;
    return split( ',', $header );
}

sub process_line {
    my ( $line, $state_key, $month_key, $sales_key, $states ) = @_;
    chomp $line;
    my @element = split( ',', $line );

    my $state = $element[0];
    $states->{$state}++;

    return {
        $state_key => $element[0],
        $month_key => $element[1],
        $sales_key => $element[2],
    };
}

sub bv_by_month {
    my ( $date_array, $state, $month ) = @_;
    my $commi = 0;
    foreach my $entry ( $date_array->@* ) {
        if ( $entry->{'code'} eq $state ) {
            $commi += $entry->{'commi'};
            last;
        }
    }
    my @top_5     = @{$date_array}[ 0 .. 4 ];
    my $avg_all   = _calculate_average($date_array);
    my $avg_top_5 = _calculate_average( \@top_5 );

    return [ $month, $commi, $avg_all, $avg_top_5 ];
}

sub _calculate_average {
    my $array_ref = shift;
    my $sum       = 0;
    my $count     = 0;
    foreach my $element ( $array_ref->@* ) {
        if ( ref $element ) {
            $sum += $element->{'commi'};
            $count++;
        }
    }
    if ( $count == 0 ) {
        return 0;
    }
    return int $sum / $count;
}

=pod

=head1 NAME

    Process::States - Process data for given states

=head1 SYNOPSIS

    use Process::States qw / process_header process_line bv_by_month /;
    process_header($header);
    process_line( $line, $state_key, $month_key, $sales_key, \%states );
    bv_by_month( \@commi_by_month, $state, ucfirst $month_conversion{$month} );

=head1 DESCRIPTION

    This module is used to process a csv with data for certain states.
    The data is separated among code, month, commi.

=head1 FUNCTION

=head2 process_header

    Gets the first line of the csv and uses it for identification.

=head2 process_line

    Processes the csv line by line.

=head2 bv_by_month

    Processes the line in order to create the requested parameters (avg, top).

=head2 _calculate_average

    Calculates the average.

=head1 AUTHOR

    Horatiu "hodinit" Lazar

=head1 LICENSE

    MIT License 2026

=cut


1;
