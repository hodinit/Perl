package MyCompany::Stuff;

use strict;
use warnings;

%MyCompany::Stuff::department_number_for = (
    finance         => 13,
    programming     =>2,
    janitorial      =>17,
    executive       =>0,
);

my $dep_number = $MyCompany::Stuff::department_number_for{programming};
print "my dep number is $dep_number";