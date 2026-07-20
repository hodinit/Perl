use strict;
use warnings;
use diagnostics;

my $i = 10;

while ( $i > 0 ) {
    if ( rand(3) > 2 ) {
        $i++;
    }
    else {
        $i--;
    }
    print $i."\n";
}
