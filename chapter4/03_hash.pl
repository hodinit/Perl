use strict;
use warnings;
use diagnostics;

my %hash = (
    banana  => 'yellow',
    apple   => 'red',
    grapes  => 'purple',
);

for my $key (keys %hash) {
    delete $hash{banana};
}
print %hash;