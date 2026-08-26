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
my @words;

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

# print Dumper(@new_lines);
