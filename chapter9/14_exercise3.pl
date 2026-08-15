use strict;
use warnings;
use utf8;
use Encode qw(decode encode);

my $count = @ARGV;
foreach my $i ( 0 .. $count - 1 ) {
    my $number    = $ARGV[$i];
    my $character = chr($number);
    print $character;
}
