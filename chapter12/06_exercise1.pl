use strict;
use warnings;
use DateTime;
use lib 'lib';
use People::Person;

my $person = People::Person->new(
    {
        name      => 'Marcus Aurelius',
        birthdate => DateTime->new(
            year  => 1980,
            month => 10,
            day   => 22,
        ),
    }
);

print $person->as_string;
