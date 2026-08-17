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
        payscale => 4,
    },
    {
        name     => 'mr. magnate',
        years    => 12,
        payscale => 1,
    },

);

sub by_seniority_then_pay_then_name {
    $b->{years}         <=> $a->{years}
      || $a->{payscale} <=> $b->{payscale}
      || $a->{name}     cmp $b->{name};
}
@employees = sort by_seniority_then_pay_then_name(@employees);

printf "Name        Years Payscale\n";
foreach my $employee (@employees) {
    printf "%-15s %2d       %2d\n" => @{$employee}{qw/name years payscale/};
}

