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

foreach my $line (@lines) {
    chomp $line;
    my @words = split ',', $line;
    if ( $words[0] eq 'UT' ) {
        push @new_lines, [@words];
    }
}

foreach my $element (@new_lines) {
    print "$element->[1] $element->[2]\n";
}
print "\n";

my @avg_for_month_all_states;
foreach my $line (@lines) {
    chomp $line;
    my @words = split ',', $line;
    if ( $words[1] eq '1' ) {
        push @avg_for_month_all_states, [@words];
    }
}

my @bv;
my $sum = 0;
foreach my $element (@avg_for_month_all_states) {
    $sum += int $element->[2];
}
say int $sum / @avg_for_month_all_states;
print "\n";

my $count = 0;
$sum = 0;
foreach my $element (@avg_for_month_all_states) {
    $sum += int $element->[2];
    $count++;
    if ( $count > 4 ) {
        last;
    }
}
say int $sum / 5;

# print Dumper(@avg_for_month_all_states);
