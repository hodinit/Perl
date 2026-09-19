#!perl
use 5.008003;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Convert::Distance::Metric' ) || print "Bail out!\n";
}

diag( "Testing Convert::Distance::Metric $Convert::Distance::Metric::VERSION, Perl $], $^X" );
