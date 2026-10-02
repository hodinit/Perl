use strict;
use warnings;
use lib 'lib';
use Line;
use Point;
use feature 'say';

my $line = Line->new(
    {
        point1 => Point->new( { x => 1, y => -1 } ),
        point2 => Point->new( { x => 4, y => -5 } ),
    }
  );

say $line->length;
