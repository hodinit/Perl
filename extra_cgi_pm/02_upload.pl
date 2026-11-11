#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use autodie;

my $q = CGI->new;

if ( my $fh = $q->upload('file') ) {
    open my $out, '>', "$ENV{DOCUMENT_ROOT}/uploads/pic.jpg";
    print {$out} <$fh>;
}

print $q->header('text/html');
my $html_file = 'templates/upload.html';
open my $fh, '<', $html_file or die "Cannot open $html_file";
while ( my $line = <$fh> ) {
    print $line;
}
close $fh;
