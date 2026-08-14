use strict;
use warnings;
use diagnostics;
use autodie;

my $number = @ARGV;
foreach my $i ( 0 .. $number - 1 ) {
    my $file = $ARGV[$i];
    open my $opened_file, '<', $file;
    print <$opened_file>, "\n";
    close $opened_file;
}
