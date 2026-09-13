#!perl
use 5.008003;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'Convert::Distance::Imperial' ) || print "Bail out!\n";
}

diag( "Testing Convert::Distance::Imperial $Convert::Distance::Imperial::VERSION, Perl $], $^X" );
