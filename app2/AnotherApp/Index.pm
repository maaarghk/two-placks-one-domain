package AnotherApp::Index;

use strictures;

sub handle
{
    my ($class, $req) = @_;

    my $about_uri = $req->script_name . "/about";

    my $output = "Hello world from AnotherApp. ";
    $output .= "<a href=\"$about_uri\">Go to About page</a>\n";

    my $res = $req->new_response(200);
    $res->content_type("text/html");
    $res->content($output);

    return $res;
}

1;