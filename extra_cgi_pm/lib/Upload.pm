package Upload;

use strict;
use warnings;
use autodie;
use Exporter::NoWork;
use Template::Tiny;
use File::Slurp qw/read_file/;

my $upload_dir = '/var/www/uploads';    # Check if your container uses /var/www/html/uploads
my $upload_url = '/uploads';

sub upload_files {
    my $q = shift;
    if ( my $fh = $q->upload('file') ) {
        my $filename = $q->param('file');
        $filename =~ s/.*[\/\\]//;
        open my $out, '>', "$upload_dir/$filename";
        binmode $out;
        print {$out} <$fh>;
        close $out;
    }
}

sub process_images {
    opendir( my $dh, $upload_dir );
    my @file_names = map { "$upload_url/$_" }
      grep { !/^\./ && -f "$upload_dir/$_" } readdir($dh);
    closedir $dh;

    my $count        = scalar @file_names;
    my $render_table = $count >= 2 ? 1 : 0;
    my @images;
    my $index = 1;
    my $row;
    my @rows;

    foreach my $url (@file_names) {
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

    return {
        images       => \@images,
        render_table => $render_table,
        rows         => \@rows,
    };
}

sub render_page {
    my ( $q, $vars ) = @_;
    print $q->header('text/html');
    my $template_code = read_file('templates/upload.html');
    my $output;
    my $template = Template::Tiny->new;
    $template->process( \$template_code, $vars, \$output );
    print $output;
}

1;
