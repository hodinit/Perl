use strict;
use warnings;
use diagnostics;

use FindBin;
use lib "$FindBin::Bin/lib";
use Convert::Distance::Imperial ':all';

printf "there are %d yards in a mile\n"         => miles_to_yards(1);
printf "there are %d feet in a mile\n"          => miles_to_feet(1);
printf "there are %d inches in a mile\n"        => miles_to_inches(1);
printf "there are %0.2f miles in a %d yards\n"  => yards_to_miles(5000),  5000;
printf "there are %0.2f miles in a %d feet\n"   => feet_to_miles(5000),   5000;
printf "there are %0.2f miles in a %d inches\n" => inches_to_miles(5000), 5000;
