use strict;
use warnings;
use Test::More;
use lib 'lib';
use TestMe ':ALL';

my @have = sort ( unique( 2, 3, 5, 4, 3, 5, 7 ) );
my @want = sort ( 2, 3, 5, 4, 7 );
is_deeply \@have, \@want,
  'unique() should return unique() elements in order';

done_testing;
