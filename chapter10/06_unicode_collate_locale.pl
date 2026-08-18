use strict;
use warnings;
use diagnostics;
use utf8::all;
use Unicode::Collate::Locale;

my @letters  = qw /z ö/;
my @reversed = reverse @letters;
my $german   = Unicode::Collate::Locale->new( locale => 'de_DE' );
my $swedish  = Unicode::Collate::Locale->new( locale => 'sv_SE' );

foreach my $letters ( \@letters, \@reversed ) {
    print "Original:    @$letters\n";
    my @german  = $german->sort(@$letters);
    my @swedish = $swedish->sort(@$letters);

    print "German:      @german\n";
    print "Swedish:     @swedish\n\n";
}
