use strict;
use warnings;
use utf8;
use Encode qw(decode encode);

my @word;
my $count = @ARGV;
foreach my $i ( 0 .. $count - 1 ) {
    my $number    = $ARGV[$i];
    my $character = chr($number);
    push( @word, $character );
}

foreach my $letter (@word) {
    printf( "\\U+%04X", ord($letter) );
}
