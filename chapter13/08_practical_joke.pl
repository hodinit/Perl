{

    package Bomb;
    use Moose::Role;
    sub fuse    { print "Bomb fuse\n" }
    sub explode { print "Bomb explode\n" }
}
{

    package Spouse;
    use Moose::Role;
    sub fuse    { print "Spouse fuse\n" }
    sub explode { print "Spouse explode\n" }
}
{

    package PracticalJoke;
    use Moose;
    with 'Bomb' => { excludes => 'explode' },
      'Spouse'  => { excludes => 'fuse' };
}

my $joke = PracticalJoke->new();
$joke->explode();
$joke->fuse();
