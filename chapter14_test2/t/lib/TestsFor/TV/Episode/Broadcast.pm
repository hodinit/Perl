package TestsFor::TV::Episode::Broadcast;

use base 'TestsFor::TV::Episode';
use DateTime;
use Test::Most;

sub class_to_test { 'TV::Episode::Broadcast' }

sub attributes : Tests(+2) {
    my $test = shift;
    $test->SUPER::attributes(
        broadcast_date => DateTime->new(
            year  => 1999,
            month => 2,
            day   => 3,
        ),
    );
}

1;
