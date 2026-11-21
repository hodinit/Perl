#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use lib 'lib';
use Upload ':ALL';

my $q = CGI->new;

upload_files($q);
my $vars = process_images();
render_page( $q, $vars );

