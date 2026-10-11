use Moose;
use lib 'lib';
use Soldier;

my $soldier = Soldier->new(
    {
        name => "Schultz",
        rank => "Sergeant",
    }
);

print $soldier->as_json;
