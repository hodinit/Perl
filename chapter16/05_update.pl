use strict;
use warnings;
use lib 'lib';
use MyDatabase 'db_handle';

my $dbh          = db_handle('rights.db');
my $sql          = 'UPDATE media SET name = ? WHERE name = ?';
my $sth          = $dbh->prepare($sql);
my $rows_updated = $sth->execute( 'The Anne Frank Stamp', 'Anne Frank Stamp' );
print $rows_updated;
