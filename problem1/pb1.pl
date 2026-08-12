use strict;
use warnings;
use diagnostics;
use Data::Dumper;

use Text::CSV;

my $csv = Text::CSV->new( { sep_char => ',' } );

open my $file, '<', 'file.csv';
my @lines = <$file>;
close $file;

my @new_lines;
for my $line (@lines) {
    chomp $line;
    push( @new_lines, $line );
}

print Dumper(@new_lines);

