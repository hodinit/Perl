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

my @files        = read_dir('uploads');
my $count        = scalar @files;
my $render_table = $count >= 3 ? 1 : 0;
my @images       = map { { url => "/uploads/$_" } } @files;
my @rows;
while ( my @chunk = splice( @files, 0, 3 ) ) {
    push @rows, {
        col1 => $chunk[0] ? "/uploads/$chunk[0]" : '',
        col2 => $chunk[1] ? "/uploads/$chunk[1]" : '',
        col3 => $chunk[2] ? "/uploads/$chunk[2]" : '',
    };
}
my $vars = {
    images       => \@images,
    render_table => $render_table,
    rows         => \@rows,
};

print $q->header('text/html');
my $template_code = read_file('templates/upload.html');
my $output;
my $template = Template::Tiny->new;
$template->process( \$template_code, $vars, \$output );
print $output;
