use strict;
use warnings;
use DateTime;
use lib 'lib';
use Person;

my $person = Person->new(
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
