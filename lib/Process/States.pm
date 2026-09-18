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
  
    foreach my $element ( $array_ref->@* ) {
        if ( ref $element ) {
            $sum += $element->{'commi'} // 0;
        }
    }

    if ( $sum == 0 ) {
        return 0;
    }

    return int $sum / scalar $array_ref->@*;
}

=pod

=head1 NAME

    Process::States - Process data for given states

=head1 SYNOPSIS

    use Process::States qw / process_header process_line bv_by_month /;

=head1 DESCRIPTION

This module is used to process a csv with data for certain states.
The data is separated among code, month, commi.

=head1 FUNCTION

=over 4

=item * Sub process_header($header);

The C<process_header> sub returns the following keys:

    my ( $state_key, $month_key, $sales_key ) = process_header($header)

=item * process_line( $line, $state_key, $month_key, $sales_key, \%states );

The C<processe_line> sub returns a hashref that maps the values in a row to the cols extracted by C<process_header()>

     return {
        $state_key => $element[0],
        $month_key => $element[1],
        $sales_key => $element[2],
    };

=item * bv_by_month( \@commi_by_month, $state, ucfirst $month_conversion{$month} );

The C<bv_by_month> calculates business value by state. It retuns the following values:

    return [ $month, $commi, $avg_all, $avg_top_5 ];

=item * Sub _calculate_average

    Sub C<_calculate_average> is a helper used by C<bv_by_month> that takes an array and 
    returns the average.

=back  

=head1 AUTHOR

    Horatiu "hodinit" Lazar

=head1 LICENSE

    MIT License 2026

=cut


1;
