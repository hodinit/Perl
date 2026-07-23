use strict;
use warnings;
use diagnostics;

my $score_for = {
    jim   => 89,
    mary  => 73,
    alice => 100,
    bob   => 83,
};

print "score for jim: ".$score_for->{'jim'}."\n";
print "score for mary: ".$score_for->{'mary'};
