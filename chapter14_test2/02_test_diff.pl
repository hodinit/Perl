use Test::More;
use Test::Differences;

my %have = (
    numbers => [ 3, 4 ],
    fields  => { this => 'that', big => 'bad' },
    extra   => [ 3, 4 ],
);
my %want = (
    numbers => [ 3, 4 ],
    fields  => { this => 'tha', big => 'bad' },
    extra   => [ 3, 5 ],
);

eq_or_diff \%have, \%want, 'have and want should be the same';
done_testing;