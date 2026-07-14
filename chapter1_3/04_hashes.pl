my %people = (
    'alice',    1,
    'bob',      2,
    'hor',      3,
);
# print ($people{'hor'}*$people{'bob'});
$people{max} = 4;

# for my $name (keys %people) {
#     print "$name is $people{$name}\n"
# }


# my @things_in_common = ( 'liars', 'fools', 'certain politicians' );
# my %count_for = (useless_things => scalar @things_in_common);

# print($count_for{useless_things});

print %people;