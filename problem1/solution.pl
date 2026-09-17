use strict;
use warnings;
use Data::Dumper;
use DateTime;
use feature 'say';
use lib 'lib';
use Process::States qw / process_header process_line bv_by_month /;

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

my @data   = ();
my %states = ();

open my $fh, '<', 'file.csv'
  or die "can't open file";
my $header = <$fh>;
my ( $state_key, $month_key, $sales_key ) = process_header($header);
while ( my $line = <$fh> ) {
    push @data, process_line( $line, $state_key, $month_key, $sales_key, \%states );
}
close $fh;

foreach my $state ( sort keys %states ) {
    my $result         = [];
    my @commi_by_month = ();
    foreach my $month ( sort { $a <=> $b } keys %month_conversion ) {
        @commi_by_month = sort { $b->{'commi'} <=> $a->{'commi'} }
          grep { $_->{'month'} == $month } @data;
        push $result->@*, bv_by_month( \@commi_by_month, $state, ucfirst $month_conversion{$month} );
    }
    print Dumper($result);
}

