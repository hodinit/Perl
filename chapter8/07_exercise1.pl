use strict;
use warnings;
use diagnostics;

my $number = '123-45-67898';

if ( $number =~ /^\d{3}-\d{2}-\d{4}$/ ) {
    print "true\n";
}
else {
    print "false\n";
}
