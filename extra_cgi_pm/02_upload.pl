#!/usr/bin/perl
use strict;
use warnings;
use CGI;
use autodie;
use Template::Tiny;
use File::Slurp qw/read_file read_dir/;

my $q = CGI->new;
if ( my $fh = $q->upload('file') ) {
    my $filename = $q->param('file');
    $filename =~ s/.*[\/\\]//;
    open my $out, '>', "uploads/$filename";
    binmode $out;
    print {$out} <$fh>;
    close $out;
}

my @files  = read_dir('uploads');
my @images = map { { url => "/uploads/$_" } } @files;
my $vars   = {
    images => \@images,
};

print $q->header('text/html');
my $template_code = read_file('templates/upload.html');
my $output;
my $template = Template::Tiny->new;
$template->process( \$template_code, $vars, \$output );
print $output;
