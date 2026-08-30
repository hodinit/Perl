use strict;
use warnings;
use Data::Dumper;
use DateTime;
use feature 'say';

open my $file, '<', 'file.csv';
my @lines = <$file>;
close $file;

my @state_extraction;
my @array_of_statistics;

@array_of_statistics = extract_data_for_given_state('UT');
print @array_of_statistics;

sub extract_data_for_given_state {
    my $state = shift;
    foreach my $line (@lines) {
        chomp $line;
        my @words = split ',', $line;
        if ( $words[0] eq $state ) {
            push @state_extraction, [@words];
        }
    }

    # print Dumper(@state_extraction);

    my @month_extraction;
    foreach my $line (@lines) {
        chomp $line;
        my @words = split ',', $line;
        push @month_extraction, [ $words[1], $words[2] ];

    }

    # print Dumper(@month_extraction);

    my @date_array;
    my $sum_all   = 0;
    my $avg_all   = 0;
    my $count     = 0;
    my $sum_top_5 = 0;
    my $avg_top_5 = 0;

    foreach my $date ( 1 .. 12 ) {
        @date_array = grep { $_->[0] == $date } @month_extraction;
        if ( @date_array != 0 ) {
            foreach my $element (@date_array) {
                if ( $count < 5 ) {
                    $sum_top_5 += int $element->[1];
                }
                $count++;
                $sum_all += int $element->[1];
            }
            $avg_all = int $sum_all / @date_array;
            if ( $count < 5 ) {
                $avg_top_5 = int $sum_top_5 / $count;
            }
            else {
                $avg_top_5 = int $sum_top_5 / 5;
            }

            # print Dumper(@date_array);
            # say "($avg_all)\n";
            # say "($avg_top_5)\n";

            $sum_all   = 0;
            $count     = 0;
            $sum_top_5 = 0;
        }
    }

    my @return_array;
    my $var3 = int $sum_all / @month_extraction;
    my $var4 = int $sum_top_5 / 5;

    # foreach my $element (@state_extraction) {
    #     push @return_array, "$element->[1] $element->[2] $var3 $var4\n";
    # }
    return @return_array;

    # foreach my $element (@month_extraction) {
    #     if ( $count < 5 ) {
    #         $sum_top_5 += int $element->[2];
    #     }
    #     $count++;
    #     $sum_all += int $element->[2];

    # }

}
