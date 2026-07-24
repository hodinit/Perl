use strict;
use warnings;
use diagnostics;

{
    my $count = 0;

    sub how_many {
        $count++;
        print "i have been called $count times\n";
    }
}

for (0..5){
    how_many();
}
