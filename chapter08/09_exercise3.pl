use strict;
use warnings;
use diagnostics;
use Data::Dumper;

my $text = <<'END';
We hired Mark in 2011-02-03. He's working on product
1034-34-345A. He is expected to finish the work on or
before 2012-12-12 because our idiot CEO thinks the world
will end.
END

my @new_dates;

my %table = (
    '01' => 'January',
    '02' => 'February',
    '03' => 'March',
    '04' => 'April',
    '05' => 'May',
    '06' => 'June',
    '07' => 'July',
    '08' => 'August',
    '09' => 'September',
    '10' => 'October',
    '11' => 'November',
    '12' => 'December',
);

foreach my $word ( split / /, $text ) {
    if ( $word =~ /^\d{4}-\d{2}-\d{2}\.?$/ ) {
        $word =~ s/\.$//;
        my @components = split /-/, $word;
        my $day        = $components[2];
        my $year       = $components[0];
        my $monthname  = $table{ $components[1] };

        my $new_word = $monthname . ' ' . $day . ', ' . $year;

        push @new_dates, $new_word;
    }
}

foreach my $date (@new_dates) {
    $text =~ s/\b\d{4}-\d{2}-\d{2}\b/$date/;
}
print $text;
