use strict;
use warnings;
use Data::Dumper;
use DateTime;
use feature 'say';

my %month_conversion = (
    1  => 'jan',
    2  => 'feb',
    3  => 'mar',
    4  => 'apr',
    5  => 'may',
    6  => 'jun',
    7  => 'jul',
    8  => 'aug',
    9  => 'sep',
    10 => 'oct',
    11 => 'nov',
    12 => 'dec',
);

my @data           = ();
my %states         = ();
my $state          = 'UT';
my @commi_by_month = ();
my $result         = [];

open my $fh, '<', 'file.csv'
  or die "can't open file";
my $header = <$fh>;
my ( $state_key, $month_key, $sales_key ) = _process_header($header);
while ( my $line = <$fh> ) {
    push @data, _process_line( $line, $state_key, $month_key, $sales_key );
}
close $fh;

foreach my $month ( sort { $a <=> $b } keys %month_conversion ) {
    @commi_by_month = sort { $b->{'commi'} <=> $a->{'commi'} }
      grep { $_->{'month'} == $month } @data;
    push $result->@*,
      bv_by_month( \@commi_by_month, $state,
        ucfirst $month_conversion{$month} );
}
print Dumper($result);

sub _process_header {
    my $header = shift;
    chomp $header;
    return split( ',', $header );
}

sub _process_line {
    my ( $line, $state_key, $month_key, $sales_key ) = @_;
    chomp $line;
    my @element = split( ',', $line );

    my $state = $element[0];
    $states{$state}++;

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
        }
    }
    my @top_5     = @{$date_array}[ 0 .. 4 ];
    my $avg_all   = _calculate_average($date_array);
    my $avg_top_5 = _calculate_average( \@top_5 );

    return [ $month, $commi, $avg_all, $avg_top_5 ];
}
