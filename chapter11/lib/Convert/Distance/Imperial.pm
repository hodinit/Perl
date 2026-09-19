package Convert::Distance::Imperial;

use strict;
use warnings;
use diagnostics;

our $VERSION = '0.001';
$VERSION = eval $VERSION;

use Exporter 'import';
our @EXPORT_OK = qw (
    miles_to_yards
    yards_to_miles
    miles_to_feet
    feet_to_miles
    miles_to_inches
    inches_to_miles
);

our %EXPORT_TAGS = ( all => \@EXPORT_OK );

use constant FEET_PER_MILE => 5_280;
use constant FEET_PER_YARD => 3;
use constant INCHES_PER_FOOT => 12;

sub miles_to_yards {
    my $miles = shift;
    return miles_to_feet($miles) / FEET_PER_YARD;
}
sub yards_to_miles {
    my $yards = shift;
    return feet_to_miles( $yards * FEET_PER_YARD );
}
sub miles_to_feet {
    my $miles = shift;
    return $miles * FEET_PER_MILE;
}
sub feet_to_miles {
    my $feet = shift;
    return $feet / FEET_PER_MILE;
}
sub miles_to_inches {
    my $miles = shift;
    return miles_to_feet($miles) * INCHES_PER_FOOT;
}
sub inches_to_miles {
    my $inches = shift;
    return feet_to_miles( $inches / INCHES_PER_FOOT );
}

1;


