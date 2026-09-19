use strict;
use warnings;
use diagnostics;
use Data::Dumper;

my $employee_numbers = <<'END_EMPLOYEES';
alice: 48472
bob:34582
# we need to fi re charlie
charlie : 45824
# denise is a new hire
denise : 34553
END_EMPLOYEES

my %employees;

foreach my $line ( split /\n/, $employee_numbers ) {
    if ( $line !~ /#/ ) {
        my @elements = split /:/, $line;
        my $name     = $elements[0];
        my $number   = $elements[1];
        $name   =~ s/\s//;
        $number =~ s/\s//;
        $employees{$name} = $number;
    }
}

print Dumper( \%employees );
