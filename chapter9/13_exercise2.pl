use strict;
use warnings;
use diagnostics;
use autodie;
use feature 'say';

while ( my $file = shift @ARGV ) {
    print_file($file);
}

sub print_file {
    my $file = shift;

    open my $fh, '<', $file;
    while ( my $line = <$fh> ) {
        chomp $line;
        next if length $line == 0;
        next if $line =~ m/^#/;
        $line =~ s/#.*//;
        say $line;
    }
    close $fh;

    return;
}
