use strict;
use warnings;
use diagnostics;

my %stat_for = (
    strength     => undef,
    intelligence => undef,
    dexterity    => undef,
);

for my $value ( values %stat_for ) {
    my $roll1 = 1 + int( rand(6) );
    my $roll2 = 1 + int( rand(6) );
    $value = $roll1+$roll2;
    if ($value<6) {
        redo();
    }
}

print <<"END_CHARACTER";
Strength:        $stat_for{strength}
Intellingence:   $stat_for{intelligence}
Dexterity:       $stat_for{dexterity}
END_CHARACTER


157
