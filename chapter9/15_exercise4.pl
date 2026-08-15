use strict;
use warnings;
use diagnostics;
use utf8;
use Encode qw(decode encode);

my $count = @ARGV;
foreach my $i ( 0 .. $count - 1 ) {
    my $word = $ARGV[$i];
    foreach my $letter ( split //, $word ) {
        print ord $letter, ' ';
    }
    print "\n";
}
