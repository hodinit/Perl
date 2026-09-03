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

my @data = ();

open my $fh, '<', 'file.csv'
  or die "can't open file";
my $header = <$fh>;
my ( $state_key, $month_key, $sales_key ) = _process_header($header);
while ( my $line = <$fh> ) {
    push @data, _process_line($line);
}
close $fh;

my @final = _extract_data_for_given_state('UT');
print Dumper( \@final );

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
    my %averages;
    my @return_array;
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

        if ( $count > 0 ) {
            $avg_all = int $sum_all / @date_array;
            if ( $count < 5 ) {
                $avg_top_5 = int $sum_top_5 / $count;
            }
            else {
                $avg_top_5 = int $sum_top_5 / 5;
            }
        }

        $averages{$date} = {
            all   => $avg_all,
            top_5 => $avg_top_5,
        };

        $sum_all   = 0;
        $count     = 0;
        $sum_top_5 = 0;
        $avg_all   = 0;
        $avg_top_5 = 0;
    }

    foreach my $entry (@data) {
        if ( $entry->{'code'} eq $input_state ) {
            push @return_array,
              [
                $month_conversion{ $entry->{'month'} },
                $entry->{'commi'},
                $averages{ $entry->{'month'} }->{'all'},
                $averages{ $entry->{'month'} }->{'top_5'},
              ];
        }
    }

    return @return_array;
}
