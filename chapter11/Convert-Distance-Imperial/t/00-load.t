#!perl
use 5.008003;
use strict;
use warnings;
use Test::More;

plan tests => 2;

BEGIN {
    use_ok( 'Convert::Distance::Imperial' ) || print "Bail out!\n";
    use_ok( 'Convert::Distance::Metric' ) || print "Bail out!\n";
}

diag( "Testing Convert::Distance::Imperial $Convert::Distance::Imperial::VERSION, Perl $], $^X" );
