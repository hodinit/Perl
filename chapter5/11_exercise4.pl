use strict;
use warnings;
use diagnostics;

my @arr          = qw( fee fie foe fum );
my $num_elements = @arr;

foreach ( my $i = 0 ; $i < $num_elements ; $i++ ) {
    print "$arr[$i]\n";
}

#less than istead of less than equals because 
#index starts at 0 and finishes at 3. with <= it finishes at 4.