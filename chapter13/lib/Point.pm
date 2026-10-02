package Point;

use Moose;
use namespace::autoclean;

has 'x' => ( is => 'ro', isa => 'Num', required => 1 );
has 'y' => ( is => 'ro', isa => 'Num', required => 1 );

1;
