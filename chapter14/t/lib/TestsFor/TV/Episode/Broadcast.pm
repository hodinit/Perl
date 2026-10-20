package TestsFor::TV::Episode::Broadcast;

use base 'TestsFor::TV::Episode';
use Test::Most;

sub attributes : Tests(+2) {
    my $test = shift;
    $test->SUPER::attributes;
}

1;
