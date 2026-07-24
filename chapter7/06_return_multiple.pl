use strict;
use warnings;
use diagnostics;

sub how_was_i_called {
    if ( not defined wantarray ) {
        print "i was called in void context\n";
    }
    elsif ( not wantarray ) {
        print "i was called in scalar context\n"
    }
    else {
        print "i was called in list contetx\n"
    }
}

how_was_i_called();
my $foo = how_was_i_called();
my ($foo) = how_was_i_called();
my @bar = how_was_i_called();
my ( $this,$that ) = how_was_i_called();
my %there = how_was_i_called();
