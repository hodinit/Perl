package TestsFor::TV::Episode;

use Test2::V0;
use base 'TestsFor';

sub attributes : Tests(14) {
    my $test               = shift;
    my %extra_attributes   = @_;
    my %default_attributes = (
        series         => 'Firefly',
        director       => 'Marita Grabiak',
        title          => 'Jaynestown',
        genre          => 'awesome',
        season         => 1,
        episode_number => 7,
        %extra_attributes,
    );
    diag $test->class_to_test;
    my $class   = $test->class_to_test;
    my $episode = $class->new(%default_attributes);
    while ( my ( $attribute, $value ) = each %default_attributes ) {
        can_ok $episode, $attribute;
        is $episode->$attribute, $value,
          "The value for '$attribute' should be correct";
    }

    my %attributes = %default_attributes;
    foreach my $attribute (qw/season episode_number/) {
        $attributes{$attribute} = 0;
        my $exception = dies {
            $class->new(%attributes);
        };

        like(
            $exception,
            qr/\Q($attribute) does not pass the type constraint/,
            "Setting $attribute to less than 0 should fail",
        );
    }
}

1;
