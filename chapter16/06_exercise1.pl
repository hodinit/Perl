use strict;
use warnings;
use DBI;

my $dbh = DBI->connect(
    'dbi:SQLite:dbname=customers.db',
    '',
    '',
    { RaiseError => 1, AutoCommit => 1 },
);

my $sth = $dbh->prepare("SELECT id, name FROM customer");
$sth->execute;

while ( my @row = $sth->fetchrow_array ) {
    print "ID: $row[0] Name: $row[1]\n";
}
