use strict;
use warnings;
use diagnostics;

my $word = 'AAA';
my $second = 'aaa';

if (lc($word) == $second) {
    print 'true';
}
else {
    print 'false';
}