package TV::Episode::Broadcast;

use Moose;
use DateTime;
use namespace::autoclean;
use base 'TV::Episode';

has 'broadcast_date' => (
    is       => 'ro',
    isa      => 'DateTime',
    required => 1,
);

__PACKAGE__->meta->make_immutable;
1;
