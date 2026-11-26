use strict;
use warnings;
use DBI;

my $database = 'customers.db';
my $dbh      = DBI->connect(
    "dbi:SQLite:dbname=$database",
    '',
    '',
    { RaiseError => 1, PrintError => 0, AutoCommit => 1 },
);
my $customer = <<"SQL";
CREATE TABLE IF NOT EXISTS customer (
    id         INTEGER      PRIMARY KEY,
    name       VARCHAR(10)  NOT NULL
);
SQL
$dbh->do($customer);

my @names            = qw/alex john mark/;
my $customer_content = <<"SQL";
INSERT INTO customer (
    name
)
VALUES ( ? )
SQL

my $sth = $dbh->prepare($customer_content);
foreach my $name (@names) {
    $sth->execute($name);
}
