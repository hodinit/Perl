use strict;
use warnings;
use utf8;
use Encode qw(decode encode);

my @word;
while (@ARGV) {
    my $number    = shift @ARGV;
    my $character = chr($number);
    push( @word, $character );
}

foreach my $letter (@word) {
    printf( "\\U+%04X", ord($letter) );
}
