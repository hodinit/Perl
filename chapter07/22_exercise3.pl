use strict;
use warnings;
use diagnostics;

sub make_multiplier {
    my $first_number = shift;
    return sub {
        $first_number * shift;
    }
}

my $times_seven = make_multiplier(7);
my $times_five  = make_multiplier(5);

print 21 == $times_seven->(3) ? "yes\n" : "no\n";
print 20 == $times_five->(4)  ? "yes\n" : "no\n";
