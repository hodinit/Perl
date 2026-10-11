use strict;
use warnings;
use lib 'lib';
use Point_Buildargs;

my $point = Point_Buildargs->new( 3,2 );

print $point->dump;