use strict;
use warnings;
use DBI;
use lib 'lib';
use MyDatabase 'db_handle';

my $dbh = db_handle('rights.db');
my $sql = <<'SQL';
UPDATE media SET license_id = ? WHERE license_id = ?;
SQL

my $sth = $dbh->prepare($sql);
$sth->execute( 'prep1', 2 );
$sth->execute( 'prep2', 1 );
$sth->execute( 2,       'prep2' );
$sth->execute( 1,       'prep1' );

