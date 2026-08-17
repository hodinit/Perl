use strict;
use warnings;
use utf8;
use Encode qw(decode encode);

while (@ARGV) {
    my $number    = shift @ARGV;
    my $character = chr($number);
    print $character;
}
