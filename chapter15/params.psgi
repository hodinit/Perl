use strict;
use warnings;
use Plack::Builder;
use Plack::Request;

builder {
    mount '/' => sub {
        my $env     = shift;
        my $request = Plack::Request->new($env);
        my @params  = sort $request->param;
        my $body    = '';
        foreach my $param (@params) {
            my $values = join '.' => $request->param($param);
            $body .= "$param=$values\n";
        }
        $body ||= "No params found";
        my $response = $request->new_response(200);
        $response->content_type('text/plain');
        $response->content($body);
        return $response->finalize;
    };
};
