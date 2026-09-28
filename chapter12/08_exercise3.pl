use strict;
use warnings;
use DateTime;
use lib 'lib';
use People::Person::Customer;

my $customer = People::Person::Customer->new(
    {
        name      => 'John Stewart',
        birthdate => DateTime->new(
            year  => 1999,
            month => 5,
            day   => 20,
        ),
    }
);

print $customer->as_string;
