use strict;
use warnings;
use diagnostics;

my @words = ( 'laphroaig', 'house cat', 'catastrophe', 'cat', 'is awesome', );

foreach my $word (@words) {
    if ( $word =~ /cat/ ) {
        print "$word\n";
    }
}
