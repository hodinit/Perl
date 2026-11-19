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

my @files        = grep { $_ ne '.gitkeep' } read_dir('uploads');
my $count        = scalar @files;
my $render_table = $count >= 2 ? 1 : 0;
my @images;
my $index = 1;
my $row   = {};
my @rows;

foreach my $file (@files) {
    my $url = "/uploads/$file";
    push @images, { url => $url };
    if ( $index == 1 ) {
        $row = {};
        push @rows, $row;
    }
    $row->{"col$index"} = $url;
    $index++;
    if ( $index > 3 ) {
        $index = 1;
    }
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
