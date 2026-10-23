use Test2::V0;
use Carp 'croak';
use Scalar::Util 'looks_like_number';

sub reciprocal {
    my $number = shift;
    unless ( looks_like_number($number) ) {
        croak("Argument to reciprocal() must be a number");
    }
    unless ($number) {
        croak("Illegal division by zero");
    }

    return 1 / $number;
}

my $exception = dies {
    reciprocal( [] )
};

like(
    $exception,
    qr/Argument to reciprocal\(\) must be a number/,
    'Passing non-numbers to reciprocal() should fail',
);
done_testing;
