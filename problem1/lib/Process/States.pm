package Process::States;

use strict;
use warnings;
use diagnostics;
use base 'Exporter';

our @EXPORT_OK = qw /
  _process_header
  _process_line
  _calculate_average
  bv_by_month
  /;
our %EXPORT_TAGS = ( all => \@EXPORT_OK );

sub _process_header {
    my $header = shift;
    chomp $header;
    return split( ',', $header );
}

sub _process_line {
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

1;
