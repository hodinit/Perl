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

# foreach my $element (@data) {
#     say $element->%*;
# }

# print Dumper (@data);

my @final = _extract_data_for_given_state('UT');

# print Dumper( \@final );

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
        $month_key => $element[1],
        $sales_key => $element[2],
    };
}

sub _extract_data_for_given_state {
    my $input_state = shift;
    my @return_array;
    foreach my $entry (@data) {
        if ( $entry->{'code'} eq $input_state ) {
            push @return_array, [ $entry->{'month'}, $entry->{'commi'} ];
        }
    }

    my @date_array;
    my $sum_all   = 0;
    my $avg_all   = 0;
    my $count     = 0;
    my $sum_top_5 = 0;
    my $avg_top_5 = 0;

    foreach my $date ( 1 .. 12 ) {
        @date_array = sort { $b->{'commi'} <=> $a->{'commi'} }
          grep { $_->{'month'} == $date } @data;

        foreach my $element (@date_array) {
            if ( $count < 5 ) {
                $sum_top_5 += $element->{'commi'};
            }
            $count++;
            $sum_all += $element->{'commi'};
        }
        print Dumper($sum_all);
        print Dumper($sum_top_5);
        print "\n";

        $sum_all   = 0;
        $count     = 0;
        $sum_top_5 = 0;
    }
    return @return_array;
}
