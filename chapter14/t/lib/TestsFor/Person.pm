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
    isa_ok $test->default_person, 'Person';
}

sub default_person {
    my $test = shift;
    return $test->class_to_test->new(
        given_name  => 'Charles',
        family_name => 'Drew',
        birthdate   => '1904-06-03',
    );
}

sub name : Tests(2) {
    my $test   = shift;
    my $person = $test->default_person;
    is $person->name, 'Charles Drew', 'name() should return the full name';
    $person->title('Dr.');
    is $person->name, 'Dr. Charles Drew',
      '... and it should be correct if we have a title';
}

sub age : Tests(2) {
    my $test   = shift;
    my $person = $test->default_person;
    can_ok $person, 'age';
    cmp_ok $person->age, '>', 100,
      'Our default person is more than one hundred years old';
}

1;
