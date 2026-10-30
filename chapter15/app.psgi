use strict;
use warnings;
use Plack::Builder;

builder {
    mount '/images.jpg' => sub {
        open my $fh, "<:raw", "images.jpg" or die $!;
        return [ 200, [ 'Content-Type' => 'image/jpeg' ], $fh ];
    };

    mount '/' => sub {
        my $env = shift;
        return $env->{PATH_INFO} eq '/'
          ? [ 200, [ 'Content-Type' => 'text/html' ], [ get_index() ] ]
          : [ 404, [ 'Content-Type' => 'text/html' ], ['404 not found'] ],;
    };
};

sub get_index {
    return <<'END';
<html>
    <head><title>Sample page</title></head>
    <body>
        <p>Anne Frank was a young lady living in Amsterdam, hiding
        from the Nazis.</p>
        <p>Everyone should read her diaries.</p>
        <img src="/images.jpg"/>
    </body>
</html>
END
}
