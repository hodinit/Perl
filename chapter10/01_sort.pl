use strict;
use warnings;
use diagnostics;
use feature 'say';

say join "\n", sort qw\ 1 9 10 99 222 \;
say join "\n", sort         { $a <=> $b } qw/ 1 9 10 99 222 /;
say join "\n", reverse sort { $a <=> $b } qw/ 1 9 10 99 222 /;
say join "\n", sort         { $b <=> $a } qw/ 1 9 10 99 222 /;
