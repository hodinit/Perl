use strict;
use warnings;
use lib "Convert-Distance-Metric/lib";
use Convert::Distance::Metric ":all";

my $converted_km_to_m = kilometers_to_meters(3.5);

printf "%0.1f kilometers are equivalet to %d meters.\n" => 3.5,
  kilometers_to_meters(3.5);
printf "%d meters are equivalet to %0.1f kilometers.\n" => $converted_km_to_m,
  meters_to_kilometers($converted_km_to_m);
