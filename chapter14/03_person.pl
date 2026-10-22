use strict;
use warnings;
use lib 'lib';
use Person;

my $person = Person->new(
    title       => 'President',
    given_name  => 'This',
    family_name => 'Guy',
    birthdate   => '1990-10-14',
);

print $person->dump;
