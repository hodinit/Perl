use strict;
use warnings;
use diagnostics;
use Try::Tiny;

sub reciprocal {
    return 1/shift;
}

for my $number ( 0..3 ) {
    my $reciprocal;

    try {
        $reciprocal = reciprocal($number);
        print "the reciprocal of $number is $reciprocal\n";
    }
    catch{
        my $error = $_;
        print "Could not calculate the recirpocal of $_: $error\n";
    };
}

#196