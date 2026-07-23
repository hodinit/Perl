use strict;
use warnings;
use diagnostics;
use Data::Dumper;

my $aref1   = [ 1, 3, 7 ];
my $aref2   = [@$aref1];
$aref2->[0] = 9;
print Dumper($aref1, $aref2);