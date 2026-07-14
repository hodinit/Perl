use strict;
use warnings;
use diagnostics;

my %hash = (
    banana  => 'yellow',
    apple   => 'red',
    grapes  => 'purple',
);

for my $fruit (keys %hash) {
    print "$fruit are $hash{$fruit}\n";
}