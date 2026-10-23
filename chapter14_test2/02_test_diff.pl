use Test2::V0;
use Test::Differences;

plan 1;

my %have = (
    numbers => [ 3, 4 ],
    fields  => { this => 'that', big => 'bad' },
    extra   => [ 3, 4 ],
);
my %want = (
    numbers => [ 3, 4 ],
    fields  => { this => 'that', big => 'bad' },
    extra   => [ 3, 4 ],
);

is \%have, \%want, 'have and want should be the same';
done_testing;
