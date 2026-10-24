use strict;
use warnings;
use Test2::V0;
use lib 'lib';
use TestMe ':ALL';

ok reciprocal(2), 'The reciprocal of 2 sohuld be true';
is reciprocal(2), .5, 'The reciprocal of 2 should be correct';

#is reciprocal(2), .4, 'The reciprocal of 2 should be correct';
like today(), qr{ ^ \d\d/\d\d/\d\d\d\d $ }x, 'today() should return a DD/MM/YYYY format';
is [ 3, 4 ], [ 3, 4 ], 'Identical array refs should match';

my @have = unique( 2, 3, 5, 4, 3, 5, 7 );
my @want = ( 2, 3, 5, 4, 7 );
is \@have, \@want,
  'unique() should return unique() elements in order';

eval { reciprocal(0) };
my $error = $@;
like $error, qr{Illegal division by zero at t/testit.t},
  'reciprocal(0) should report error';

done_testing;
