use strict;
use warnings;
use diagnostics;
use Data::Dumper;

my @numbers = ( 0x23, 0xAA, 0xaa, 0x01, 0xfB );
my @sorted  = sort { $b <=> $a } @numbers;

foreach (@sorted) {
    printf "0x%02X ", $_;
}
print "\n";
