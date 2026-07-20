use strict;
use warnings;
use diagnostics;

my $number = 0;

while ( $number > 0 ) {
    print "you should never see this";
}

do {
    print "i am seeing this";
} while $number > 0;
