use strict;
use warnings;
use diagnostics;
use autodie;

my $number = @ARGV;
foreach my $i ( 0 .. $number - 1 ) {
    my $file = $ARGV[$i];
    open my $opened_file, '<', $file;
    my @lines = grep { !/^\s*#/ && !/^\s*$/ } <$opened_file>;
    print @lines;
    close $opened_file;

    open $opened_file, '>', $file;
    print $opened_file @lines;
    close $opened_file;
}
