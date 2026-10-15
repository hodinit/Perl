package TestsFor::Person;

use Test::Most;
use base 'TestsFor';
use Person;
use DateTime;

sub class_to_test { 'Person' }

sub constructor : Tests(3) {
    my $test  = shift;
    my $class = $test->class_to_test;
    can_ok $class, 'new';
    throws_ok { $class->new }
    qr /Attribute.*required/,
      "Creating a $class without proper attributes should fail";
    my $person = $class->new(
        given_name  => 'Charles',
        family_name => 'Drew',
        birthdate   => '1904-06-03',
    );
    isa_ok $person, $class;
}

1;
