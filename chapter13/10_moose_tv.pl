use strict;
use warnings;
use lib 'lib';
use TV::Episode;

my $episode = TV::Episode->new(
    {
        series         => 'Lanterns',
        director       => 'Joss Whedon',
        title          => 'DC',
        genre          => 'awesome',
        season         => 1,
        episode_number => 1,
    }
);

print $episode->as_string;
