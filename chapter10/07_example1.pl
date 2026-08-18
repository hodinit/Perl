use strict;
use warnings;
use diagnostics;

my %sort_oder_for = (
    General => 1,
    Colonel => 2,
    Major   => 3,
    Captain => 4,
    Private => 5,
);

my @soldiers = (
    {
        name => 'Custer',
        rank => 'General'
    },
    {
        name => 'Crassus',
        rank => 'General'
    },
    {
        name => 'Burnside',
        rank => 'General'
    },
    {
        name => 'Potter',
        rank => 'Colonel'
    },
    {
        name => 'Bickle',
        rank => 'Private'
    },
);

@soldiers = sort {
         $sort_oder_for{ $a->{rank} } <=> $sort_oder_for{ $b->{rank} }
      || $a->{name} cmp $b->{name}

} @soldiers;

foreach my $soldier (@soldiers) {
    print "$soldier->{rank} $soldier->{name}\n";
}
