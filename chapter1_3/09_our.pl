package MyCompany::Stuff;

use strict;
use warnings;

our %department_number_for;
our $some_other_package_variable;

%department_number_for = (
    finance         => 13,
    programming     =>2,
    janitorial      =>17,
    executive       =>0,
);
$some_other_package_variable = 42;
print ($department_number_for{janitorial}."\n");

our $answer = 40;
{
    local $answer = $answer;
    print ("1st is $answer\n");
    $answer +=2;
    print "2nd is $answer\n";
    $answer +=2;
    print "2nd is $answer\n";
}
print $answer;
