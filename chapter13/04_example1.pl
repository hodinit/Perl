use strict;
use warnings;
use lib 'lib';
use DateTime;
use Person;

my $person = Person->new(
    {
        name      => 'Randall Park',
        birthdate => DateTime->new(
            year  => 1970,
            month => 4,
            day   => 6,
        ),
    }
);

print $person->name, ' is ', $person->age, ' years old.';
