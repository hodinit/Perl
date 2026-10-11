package Role::Does::ToHash;

use Moose::Role;
use JSON 'encode_json';

requires qw /
  serializable_attributes
  /;

sub to_hash {
    my $self   = shift;
    my %object = map { $_ => $self->$_ } $self->serializable_attributes;
    return encode_json( \%object );
}

1;
