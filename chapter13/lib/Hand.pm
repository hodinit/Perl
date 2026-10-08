package Hand;

use Moose;
use Moose::Util::TypeConstraints;
use namespace::autoclean;

subtype 'NonNegativeInteger' => as 'Int' => where { $_ >= 0 }
=> message { "A hand must have 0 or more fingers, not $_" };

has 'fingers' => (
    is       => 'ro',
    isa      => 'NonNegativeInteger',
    required => 1,
);

__PACKAGE__->meta->make_immutable;
1;
