use strict;
use warnings;
use Test2::V0;
use lib 'lib';
use TestMe ':ALL';

plan 1;

my @have = sort ( unique( 2, 3, 5, 4, 3, 5, 7 ) );
my @want = sort ( 2, 3, 5, 4, 7 );
is \@have, \@want,
  'unique() should return unique() elements in order';

done_testing;
