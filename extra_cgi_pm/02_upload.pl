#!/usr/bin/perl
use strict;
use warnings;
use CGI;

my $q         = CGI->new;
my $saved_img = '/tmp/uploaded_image';

if ( my $fh = $q->upload('file') ) {
    open my $out, '>', $saved_img;
    print {$out} <$fh>;
    close $out;
}

if ( $q->param('view') ) {
    print $q->header('image/jpeg');
    open my $in, '<', $saved_img or die;
    while ( my $line = <$in> ) {
        print $line;
    }
    print <$in>;
    close $in;
}

print $q->header('text/html');
my $html_file = 'templates/upload.html';
open my $fh, '<', $html_file or die "Cannot open $html_file";
while ( my $line = <$fh> ) {
    print $line;
}
close $fh;
