use strict;
use warnings;

my $sales = {
    monday    => { jim => 2, mary => 1 },
    tuesday   => { jim => 3, mary => 5 },
    wednesday => { jim => 7, mary => 3 },
    thursday  => { jim => 4, mary => 5 },
    friday    => { jim => 1, mary => 2 },
};

my $num_sales = $sales->{friday}{mary};

print $num_sales;