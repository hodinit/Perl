use strict;
use warnings;
use diagnostics;

use List::Util 'shuffle';

my ( $WIDTH, $HEIGHT ) = ( 4, 4 );
my %OPPOSITE_OF = (
    north => 'south',
    south => 'north',
    west  => 'east',
    east  => 'west',
);

my @maze;
tunnel( 0, 0, \@maze );
print render_maze( \@maze );
exit;

sub tunnel {
    my ( $x, $y, $maze ) = @_;
    my @directions = shuffle keys %OPPOSITE_OF;
    foreach my $direction (@directions) {
        my ( $new_x, $new_y ) = ( $x, $y );
        if    ( 'east' eq $direction )  { $new_x += 1; }
        elsif ( 'west' eq $direction )  { $new_x -= 1; }
        elsif ( 'south' eq $direction ) { $new_y += 1; }
        else                            { $new_y -= 1; }

        if ( have_not_visited( $new_x, $new_y, $maze ) ) {
            $maze->[$y][$x]{$direction} = 1;
            $maze->[$new_y][$new_x]{ $OPPOSITE_OF{$direction} } = 1;

            no warnings 'recursion';
            tunnel( $new_x, $new_y, $maze );
        }
    }
    return;
}

sub have_not_visited {
    my ( $x, $y, $maze ) = @_;

    return if $x < 0          or $y < 0;
    return if $x > $WIDTH - 1 or $y > $HEIGHT - 1;
    return if $maze->[$y][$x];
    return 1;
}

sub render_maze {
    my $maze      = shift;
    my $as_string = "_" x ( 1 + $WIDTH * 2 );
    $as_string .= "\n";

    for my $y ( 0 .. $HEIGHT - 1 ) {
        $as_string .= "|";

        for my $x ( 0 .. $WIDTH - 1 ) {
            my $cell = $maze->[$y][$x];

            $as_string .= $cell->{south} ? " " : "_";
            $as_string .= $cell->{east}  ? " " : "|";
        }
        $as_string .= "\n";
    }
    return $as_string;
}
