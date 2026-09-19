use strict;
use warnings;
use diagnostics;
use autodie;

while (@ARGV) {
    my $file = shift @ARGV;

    if ( -e $file ) {
        open my $opened_file, '<', $file;
        while ( my $line = <$opened_file> ) {
            print $line;
        }
        close $opened_file;
    }
    else {
        open my $new_file, '>', $file;
        close $new_file;
    }
}
