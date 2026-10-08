package User;

use Moose;
use namespace::autoclean;
use Digest::MD5 'md5_hex';

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


__PACKAGE__->meta->make_immutable;
1;
