use strict;
use warnings;
use Data::Dumper;
use DateTime;
use feature 'say';

open my $file, '<', 'file.csv';
my @lines = <$file>;
close $file;

my @state_extraction;

extract_data_for_given_state('UT');

sub extract_data_for_given_state {
    my $input_state = shift;
    foreach my $line (@lines) {
        chomp $line;
        my @words = split ',', $line;
        push @state_extraction, [@words];
    }

    # print Dumper(@state_extraction);
    my @given_state_bv;
    foreach my $state (@state_extraction) {
        if ( $state->[0] eq $input_state ) {
            push @given_state_bv, [ $state->[1], $state->[2] ];
        }
    }

    my @date_array;
    my $sum_all   = 0;
    my $avg_all   = 0;
    my $count     = 0;
    my $sum_top_5 = 0;
    my $avg_top_5 = 0;

    foreach my $date ( 1 .. 12 ) {
        @date_array = grep { $_->[1] == $date } @state_extraction;
        if ( @date_array != 0 ) {
            foreach my $element (@date_array) {
                if ( $count < 5 ) {
                    $sum_top_5 += int $element->[2];
                }
                $count++;
                $sum_all += int $element->[2];
            }
            $avg_all = int $sum_all / @date_array;
            if ( $count < 5 ) {
                $avg_top_5 = int $sum_top_5 / $count;
            }
            else {
                $avg_top_5 = int $sum_top_5 / 5;
            }

            foreach my $element (@given_state_bv) {
                if ( $date == int $element->[0] ) {
                    push $element->@*, $avg_all, $avg_top_5;
                }
            }

            $sum_all   = 0;
            $count     = 0;
            $sum_top_5 = 0;
        }
    }

    foreach my $element (@given_state_bv) {
        say "[$element->[0] $element->[1] $element->[2] $element->[3]],";
    }
}
