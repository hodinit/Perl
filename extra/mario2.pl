#!/usr/bin/perl

use strict;
use warnings;

use feature 'say';

print "Please give me the pyramid size";
# user input
my $size = <STDIN>;
chomp $size;
my $stair = '#';
my $space = " ";

foreach my $i (reverse(1 .. $size)) {
	foreach my $j (1 .. $size) {
		# skip using next statment
		next if $j == 1;
		say $space x ($i - $j) . $stair x ($j);
	}
	# end the loop
	last;
}

