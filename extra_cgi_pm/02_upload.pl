#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use autodie;
use Template::Tiny;
use File::Slurp 'read_file';

my $q = CGI->new;

if ( my $fh = $q->upload('file') ) {
    open my $out, '>', "$ENV{DOCUMENT_ROOT}/uploads/pic.jpg";
    print {$out} <$fh>;
}

print $q->header('text/html');
my $template_code = read_file('templates/upload.html');
my $output;
my $template = Template::Tiny->new;

$template->process( \$template_code, {}, \$output );
print $output;
