use strict;
use warnings;
use Test2::V0;

plan 3;

ok 7, '7 should evaluate to a true value';
is 5 - 2, 3, '... and 5 - 2 should equal three';
ok 0, 'This test is destined to fail';

done_testing;
