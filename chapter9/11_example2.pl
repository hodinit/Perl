use strict;
use warnings;
use diagnostics;
use autodie ':all';
use File::Spec::Functions qw( catdir splitdir );

my $dir = @ARGV ? $ARGV[0] : '.';

unless ( -d $dir ) {
    die "($dir) is not a directory";
}
print_entries( $dir, 0 );
exit 0;

sub print_entries {
    my ( $dir, $depth ) = @_;
    my @directories = grep { $_ } splitdir($dir);
    my $short_name  = $directories[-1];
    my $prefix      = '|  ' x $depth;

    print "$prefix$short_name/\n";
    opendir( my $dh, $dir );

    my @entries = sort grep { !/^\./ } readdir($dh);
    foreach my $entry (@entries) {
        my $path = catdir( $dir, $entry );
        if ( -f $path ) {
            print "$prefix|--$entry\n";
        }
        elsif ( -d _ ) {
            print_entries( $path, $depth + 1 );
        }
        else {
            #skip anything not file or dir
        }
    }
}
