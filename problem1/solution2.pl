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

my @data   = ();
my %states = ();

open my $fh, '<', 'file.csv';
my $header = <$fh>;
my ( $state_key, $month_key, $sales_key ) = _process_header($header);
while ( my $line = <$fh> ) {
    push @data, _process_line($line);
}
close $fh;

print Dumper( \@data );

sub _process_header {
    my $header = shift;
    chomp $header;
    return split( ',', $header );
}

sub _process_line {
    my $line = shift;
    chomp $line;
    my @element = split( ',', $line );

    return {
        $state_key => $element[0],
        $month_key => $month_conversion{ $element[1] },
        $sales_key => $element[2],
    };
}
