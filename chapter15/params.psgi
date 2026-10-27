use strict;
use warnings;
use Plack::Builder;
use Plack::Request;
use Template::Tiny;
use File::Slurp 'read_file';
use HTML::Entities 'encode_entities';

builder {
    mount '/' => sub {
        my $env     = shift;
        my $request = Plack::Request->new($env);
        my @params  = get_params_array($request);
        my $content = get_content(
            'templates/params.tt',
            {
                params      => \@params,
                have_params => scalar @params,
            }
        );
        return response( $request, $content );
    };

    mount '/login' => sub {
        my $request = Plack::Request->new(shift);
        my $content;
        if ( $request->param('username') && $request->param('password') ) {
            my @params = get_params_array($request);
            $content = get_content(
                'templates/params.tt',
                {
                    params      => \@params,
                    have_params => scalar @params,
                }
            );
        }
        else {
            $content = get_content('templates/login.tt');
        }
        return response( $request, $content );
    };
};

sub get_params_array {
    my $request = shift;
    my @params;
    foreach my $param ( sort $request->param ) {
        my $values = join ',' => $request->param($param);
        push @params => {
            name  => encode_entities($param),
            value => encode_entities($values),
        };
    }
    return @params;
}

sub response {
    my ( $request, $content ) = @_;
    my $response = $request->new_response(200);
    $response->content_type('text/html');
    $response->content($content);
    return $response->finalize;
}

sub get_content {
    my ( $file, $vars ) = @_;
    my $template_code = read_file($file);
    my $output;
    my $template = Template::Tiny->new;
    $template->process( \$template_code, $vars, \$output );
    return $output;
}
