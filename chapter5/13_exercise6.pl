use strict;
use warnings;
use diagnostics;

my %stat_for = (
    strength     => undef,
    intelligence => undef,
    dexterity    => undef,
);

STATS: for my $key ( keys %stat_for ) {
    my $roll1 = 1 + int( rand(6) );
    my $roll2 = 1 + int( rand(6) );
    $stat_for{$key} = $roll1 + $roll2;
    if ( $stat_for{$key} < 6 ) {
        redo STATS;
    }
}

print <<~"END_CHARACTER";
    Strength:        $stat_for{strength}
    Intellingence:   $stat_for{intelligence}
    Dexterity:       $stat_for{dexterity}
END_CHARACTER
