use strict;
use warnings;
use diagnostics;

my $hero = 'Ovid';
my $fool = $hero;
print "$hero is absent. $fool is a fool";

my %snacks = (
    stinky => 'limburger',
    yummy => 'brie',
    surprise => 'soap',
);

my @cheese_tray = keys (%snacks);
print "our cheese tray will have @cheese_tray"


#97