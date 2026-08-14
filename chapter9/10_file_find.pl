use strict;
use warnings;
use diagnostics;
use File::Find;

find( \&wanted, '.' );

sub wanted {
    if ( /\.txt/ && -f $_ && -z _ ) {
        unlink $_ or die "could not unlink '$File::Find::name': $!";
    }
}
