use strict;
use warnings;
use diagnostics;

my @fahreheit = ( 0, 32, 65, 80, 212 );
my @celsius = map {($_ -32)* (5/9)} @fahreheit;
@celsius = qq("@celsius");

print @celsius;

