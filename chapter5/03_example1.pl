use strict;
use warnings;
use diagnostics;

my @array = ( 3,4,1,4,7,7,4,1,3,8 );
my %unordered;
@unordered{@array} = undef;

for my $key (keys %unordered) {
    print "unordered: $key\n";
}

my %seen;
my @ordered;

for my $element (@array) {
    if ( not $seen{$element}++ ){
        push @ordered, $element;
    }
}

for my $element (@ordered) {
    print "ordered: $element\n";
}

#141