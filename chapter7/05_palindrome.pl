use strict;
use warnings;
use diagnostics;

sub is_palindrome {
    my $word = lc shift;
    if ($word eq scalar reverse $word) {
        return 1;
    }
    else {
        return;
    }
}

for my $word ( qw(Abba abba notabba) ) {
    my $maybe = is_palindrome($word) ? "" : "not";
    print "$word is $maybe a palindrome\n";
}