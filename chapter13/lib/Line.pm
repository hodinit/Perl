package Line;

use Moose;

has 'point1' => ( is => 'ro', isa => 'Point', required => 1 );
has 'point2' => ( is => 'ro', isa => 'Point', required => 1 );

sub length {
    my $self = shift;
    return sqrt( ( $self->point1->x - $self->point2->x )**2 + ( $self->point1->y - $self->point2->y )**2 );
}

1;
