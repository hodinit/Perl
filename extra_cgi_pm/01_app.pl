#!/usr/bin/perl
use strict;
use warnings;
use CGI;

my $q = CGI->new;
print $q->header('text/html');
my $html_file = 'templates/index.html';
open my $fh, '<', $html_file or die "Cannot open $html_file";
while ( my $line = <$fh> ) {
    print $line;
}
close $fh;
