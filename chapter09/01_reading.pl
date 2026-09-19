use strict;
use warnings;
use diagnostics;

my $filename = 'targets.txt';
open my $spies_to_espy, '<', $filename
  or die "cannot open '$filename' for writing: $!";

while ( my $line = <$spies_to_espy> ) {
    next if $line =~ /^\s*#/;
    chomp($line);
    my ( $name, $case_number, $description ) = split /\|/, $line;
    print "$name ($case_number): $description\n";
}
close $spies_to_espy or die "could not close '$filename': $!";
