use strict;
use warnings;
use diagnostics;
use utf8;
use Encode qw(decode encode);

while (@ARGV) {
    my $word = shift @ARGV;
    foreach my $letter ( split //, $word ) {
        print ord $letter, ' ';
    }
    print "\n";
}
