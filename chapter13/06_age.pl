{

    package Person;

    use Moose;
    use DateTime;
    use lib 'lib';
    use My::Company::Moose::Types;
    use namespace::autoclean;

    has 'name' => (
        is       => 'ro',
        isa      => 'Str',
        required => 1,
    );

    has 'age' => (
        is       => 'ro',
        isa      => 'MyCompany:18orOlder',
        required => 1,
    );
}

my $youngster = Person->new(
    name => 'Youngster',
    age  => DateTime->new(
        year  => 2010,
        month => 1,
        day   => 1,
    ),
);

