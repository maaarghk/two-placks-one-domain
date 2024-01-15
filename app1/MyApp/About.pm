package MyApp::About;

use strictures;

sub handle
{
    my ($class, $req) = @_;

    my $res = $req->new_response(200);
    $res->content_type("text/html");
    $res->content("About MyApp");

    return $res;
}

1;