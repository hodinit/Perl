use strict;
use warnings;
use diagnostics;
use autodie;

while (@ARGV) {
    my $file = shift @ARGV;

    open my $opened_file, '<', $file;
    my @lines;
    while ( my $line = <$opened_file> ) {
        if ( $line =~ /^\s*#/ || $line =~ /^\s*$/ ) {
            next;
        }
        push( @lines, $line );
    }
    close $opened_file;

    open $opened_file, '>', $file;
    foreach my $line (@lines) {
        print $opened_file $line;
    }
    close $opened_file;
}
