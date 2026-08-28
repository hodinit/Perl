use strict;
use warnings;
use diagnostics;
use Data::Dumper;
use DateTime;
use feature 'say';

open my $file, '<', 'file.csv';
my @lines = <$file>;
close $file;

my @new_lines;
my @array_of_statistics;


@array_of_statistics = extract_data_for_given_state('UT');
print @array_of_statistics;


sub extract_data_for_given_state {
    my $state = shift;
    foreach my $line (@lines) {
        chomp $line;
        my @words = split ',', $line;
        if ( $words[0] eq $state ) {
            push @new_lines, [@words];
        }
    }


    my @avg_for_month_all_states;
    foreach my $line (@lines) {
        chomp $line;
        my @words = split ',', $line;
        if ( $words[1] eq '1' ) {
            push @avg_for_month_all_states, [@words];
        }
    }

    my $count = 0;
    my $sum_top_5 = 0;
    my $sum_all = 0;

    foreach my $element (@avg_for_month_all_states) {
        if ( $count <5 ) {
            $sum_top_5 += int $element->[2];
        }
        $count++;    
        $sum_all += int $element->[2];

    }
    my $var3 = int $sum_all / @avg_for_month_all_states;
    my $var4 = int $sum_top_5/5;



    my @return_array;
    foreach my $element (@new_lines) {
        push @return_array, "$element->[1] $element->[2] $var3 $var4\n";
    }
    return @return_array;
}