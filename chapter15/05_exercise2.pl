use strict;
use warnings;
use WWW::Mechanize;
use Data::Faker;
use HTML::TableExtract;
use feature 'say';

my $url  = "http://127.0.0.1:5000/";
my $mech = WWW::Mechanize->new;
$mech->get($url);
$mech->follow_link( text_regex => qr/click here/i );
my $faker        = Data::Faker->new;
my $extractor    = HTML::TableExtract->new;
my $count        = 0;
my $sum_strength = 0;
my $sum_intel    = 0;
my $sum_health   = 0;

foreach ( 0 .. 99 ) {
    my $name = $faker->name;
    $mech->submit_form(
        form_number => 1,
        fields      => {
            name       => $name,
            education  => 'engineering',
            profession => 'programmer',
            birthplace => 'earth',
        },
    );

    $extractor = HTML::TableExtract->new;
    $extractor->parse( $mech->content );

    foreach my $table ( $extractor->tables ) {
        foreach my $row ( $table->rows ) {
            if ( $row->[0] =~ /strength/i ) {
                $sum_strength += int( $row->[1] );
            }
            if ( $row->[0] =~ /intelligence/i ) {
                $sum_intel += int( $row->[1] );
            }
            if ( $row->[0] =~ /health/i ) {
                $sum_health += int( $row->[1] );
            }
            printf "%-20s - %s\n" => $row->@*;
        }
        print "\n";
    }

    $mech->get($url);
    $mech->follow_link( text_regex => qr/click here/i );
    $count++;
}

say "The avg strength is: ",     $sum_strength / $count;
say "The avg intelligence is: ", $sum_intel / $count;
say "The avg health is: ",       $sum_health / $count;
