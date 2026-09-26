package People::Customer;

use strict;
use warnings;
use lib 'lib';
use base 'People::Person';

sub _initialize {
    my ( $self, $arg_for ) = @_;
    my %arg_for = $arg_for->%*;
    $self->SUPER::_initialize( \%arg_for );
}

sub validation {
    my $self    = shift;
    my $verdict = ( $self->age > 18 ) ? 'yes' : 'no';
    return $verdict;
}

sub as_string {
    my $self   = shift;
    my $output = $self->SUPER::as_string;
    $output .= sprintf "%-14s - %s\n", 'Accepted', $self->validation;
}

1;
