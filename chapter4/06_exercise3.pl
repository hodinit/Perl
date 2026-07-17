use strict;
use warnings;
use diagnostics;

my @ids = qw( AAA bbb Ccc ddD EEE );
my @upper;

for my $word (@ids) {
    if (uc($word) eq $word) {
        push @upper, $word;
    }
}

print qq(@upper);