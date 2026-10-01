# The following code works, but it will likely break if you try to subclass it. Why?

package Item;
use strict;
use warnings;

sub new {
    my ( $class, $name, $price ) = @_;
    my $self = bless {};
    $self->_initialize( $name, $price );
    return $self;
}

sub _initialize {
    my ( $self, $name, $price ) = @_;
    $self->{name}  = $name;
    $self->{price} = $price;
}

sub name  { $_[0]->{name} }
sub price { $_[0]->{price} }

1;

# Because the _initialize method works on the actual data instead of creating
# a copy like this "my %arg_for = $arg_for->%*;" when we worked with a hash.
# Also I don t know how optimal it is to work without hashes, and also bless
# is missing ", $class".
