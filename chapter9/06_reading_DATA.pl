use strict;
use warnings;
use diagnostics;
use Data::Dumper;

my %config;

while (<DATA>) {
    next if /^\s*#/;
    next unless /(\w+)\s*=\s*(\w+)/;

    my ( $key, $value ) = ( $1, $2 );
    if ( exists $config{$key} ) {
        if ( !ref $config{$key} ) {
            $config{$key} = [ $config{$key} ];
        }
        push @{ $config{$key} } => $value;
    }
    else {
        $config{$key} = $value;
    }
}
print Dumper( \%config );

__DATA__
max_tries = 2
timeout = 30

user = Ovid
user = Sally
user = Bob
