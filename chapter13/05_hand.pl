use strict;
use warnings;
use lib 'lib';
use Hand;

my $hand = Hand->new(
    {
        fingers => -4,
    }
);

print $hand->fingers;
