use strict;
use warnings;
use diagnostics;

my @employees = (
    {
        name     => 'sally jones',
        years    => 4,
        payscale => 4,
    },
    {
        name     => 'abby hoffman',
        years    => 1,
        payscale => 10,
    },
    {
        name     => 'jack johnson',
        years    => 4,
        payscale => 5,
    },
    {
        name     => 'mr. magnate',
        years    => 12,
        payscale => 1,
    },

);

@employees =
  sort { $b->{years} <=> $a->{years} || $a->{payscale} <=> $b->{payscale} }
  @employees;

printf "Name        Years Payscale\n";
foreach my $employee (@employees) {
    printf "%-15s %2d       %2d\n" => @{$employee}{qw/name years payscale/};
}
