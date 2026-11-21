#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use autodie;
use Template::Tiny;
use File::Slurp 'read_file';

my $q = CGI->new;
print $q->header('text/html');
my $template_code = read_file('templates/index.html');
my $output;
my $template = Template::Tiny->new;

$template->process( \$template_code, {}, \$output );
print $output;