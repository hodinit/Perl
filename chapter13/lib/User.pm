package User;

use Moose;
use namespace::autoclean;
use Digest::MD5 'md5_hex';
with "Role::Does::ToHash";

has 'username' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has 'password' => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

sub BUILD {
    my $self   = shift;
    my $digest = md5_hex( $self->password );
    $self->{password} = $digest;
}

sub password_eq {
    my $self  = shift;
    my $input = shift;
    if ( $self->password eq md5_hex($input) ) {
        return 'true';
    }
    else {
        return 'false';
    }
}

sub serializable_attributes {
    my $self = shift;
    my @output;
    foreach my $attribute ( $self->meta->get_all_attributes ) {
        my $name = $attribute->name;
        if ( !ref( $self->$name ) ) {
            push @output, "$name";
        }
    }
    return @output;
}


__PACKAGE__->meta->make_immutable;
1;
