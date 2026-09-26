package People::Person;

use strict;
use warnings;
use lib 'lib';
use DateTime;
use Carp 'croak';

sub new {
    my ( $class, $arg_for ) = @_;
    my $self = bless {}, $class;
    $self->_initialize($arg_for);
    return $self;
}

sub _initialize {
    my ( $self, $arg_for ) = @_;
    my %arg_for = $arg_for->%*;
    $self->{name} = delete $arg_for{name};
    my $birthdate = delete $arg_for{birthdate};
    $self->{birthdate} = $birthdate;
}

sub age {
    my $self = shift;
    my $age  = ( DateTime->now - $self->{birthdate} )->years;
    return $age;
}

sub name      { shift->{name} }
sub birthdate { shift->{birthdate} }

sub as_string {
    my $self       = shift;
    my $name       = $self->name;
    my $birthdate  = $self->birthdate;
    my $age        = $self->age;
    my @properties = qw (
      name
      birthdate
      age
    );
    my $output = '';

    foreach my $property (@properties) {
        $output .= sprintf "%-14s - %s\n", ucfirst($property), $self->$property;
    }
    return $output;
}

1;
