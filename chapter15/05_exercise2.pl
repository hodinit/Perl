use strict;
use warnings;
use WWW::Mechanize;
use Data::Faker;
use HTML::TableExtract;

my $url  = "http://127.0.0.1:5000/";
my $mech = WWW::Mechanize->new;
$mech->get($url);
$mech->follow_link( text_regex => qr/click here/i );
my $faker     = Data::Faker->new;
my $extractor = HTML::TableExtract->new;

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

    $extractor->parse( $mech->content );

    foreach my $table ( $extractor->tables ) {
        foreach my $row ( $table->rows ) {
            printf "%-20s - %s\n" => $row->@*;
        }
        print "\n";
    }

    $mech->get($url);
    $mech->follow_link( text_regex => qr/click here/i );
}

