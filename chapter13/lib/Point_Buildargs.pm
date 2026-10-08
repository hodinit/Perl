package Point_Buildargs;

use Moose;

has 'x' => ( is => 'ro', isa => 'Num', required=>1 );
has 'y' => ( is => 'ro', isa => 'Num', required=>1 );

around 'BUILDARGS' => sub {
    my $orig = shift;
    my $class = shift;
    if ( @_ == 2) {
        my ( $x,$y ) = @_;     # Point->new( x,y )
        return $class->$orig( x=> $x, y=>$y );
    }
    else {
        return $class->$orig(@_);
    }
};

1;