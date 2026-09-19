use strict;
use warnings;
use diagnostics;

my $temperature = 22;

print $temperature < 15
  ? "Too cold\n"
  : ( $temperature > 35 ? "Too hot\n" : "perfect" );
