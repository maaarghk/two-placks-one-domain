package AnotherApp::About;

use strictures;

sub handle
{
    my ($class, $req) = @_;

    my $res = $req->new_response(200);
    $res->content_type("text/html");
    $res->content("About AnotherApp");

    return $res;
}

1;