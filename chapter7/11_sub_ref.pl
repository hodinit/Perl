use strict;
use warnings;

sub reciprocal { return 1/shift };

my $reciprocal = \&reciprocal;

my $result = &$reciprocal(5);

print $result;