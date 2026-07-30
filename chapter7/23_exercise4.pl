use strict;
use warnings;
use diagnostics;

sub sum {
    my @numbers = @_;
    if ( scalar @numbers == 0 ) {
        return 0;
    }
    my $number = shift @numbers;
    return $number + sum(@numbers);
}

my @list = ( 5, 2, 3, 8 );
print sum(@list), "\n";
