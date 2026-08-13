use strict;
use warnings;
use diagnostics;

while (<>) {
    if (/^\s*#/) {
        print;
        next;
    }
    chomp;
    my ( $name, $description, $number ) = split /\|/, $_;
    if ( defined $name ) {
        printf "$name|%05d|$description\n", $number;
    }
}
