package Role::Serializable::JSON;

use Moose::Role;
use JSON 'encode_json';

requires qw /
  serializable_attributes
  /;

sub as_json {
    my $self   = shift;
    my %object = map { $_ => $self->$_ } $self->serializable_attributes;
    return encode_json( \%object );
}

1;
