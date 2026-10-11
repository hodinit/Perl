package Soldier;

use Moose;
use namespace::autoclean;
with "Role::Serializable::JSON";

has 'name' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has 'rank' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

sub serializable_attributes {
    return qw / name rank /;
}

__PACKAGE__->meta->make_immutable;
1;
