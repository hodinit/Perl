{

    package Person;
    use Moose;
    use MooseX::StrictConstructor;

    has 'name' => (
        is       => 'ro',
        isa      => 'Str',
        required => 1,
    );

    has 'birthdate' => (
        is       => 'ro',
        isa      => 'DateTime',
        required => 0,
    );
}

use DateTime;

my $person = Person->new(
    {
        name      => 'foo',
        birthdate => DateTime->new(
            year  => 1999,
            month => 2,
            day   => 3,
        ),
    }
);

print $person->birthdate;
