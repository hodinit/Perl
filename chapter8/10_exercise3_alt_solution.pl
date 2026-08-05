use strict;
use warnings;
use diagnostics;

use DateTime;
use Data::Dumper;

use feature 'say';

my $text = <<'END';
We hired Mark in 2011-02-03. He's working on product
1034-34-345A. He is expected to ﬁnish the work on or
before 2012-12-12 because our idiot CEO thinks the world
will end.
END

my %months = (
    '2011-02-03' => '02 February 2011',
    '2012-12-12' => '12 December 2012'
);

$text =~ s/
(\d{4}-\d{2}-\d{2}) # capture date
(?=\.|\s) # use the anchor
/format_date($1) # with the e flag u can excute code in the regex
/gexi;

say $text;

sub format_date {
    my $date_string = shift;

    my ( $year, $month, $day ) = split /-/, $date_string;

    my $date_obj = DateTime->new(
        year  => $year,
        month => $month,
        day   => $day
    );

    return sprintf "%s %s %s", $day, $date_obj->month_name(), $date_obj->year;
}
