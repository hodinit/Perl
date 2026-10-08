use strict;
use warnings;
use lib 'lib';
use User;
use feature 'say';

my $user = User->new(
    {
        username => 'Alex',
        password => 'foobar',
    }
);

say $user->password_eq('fobar');
