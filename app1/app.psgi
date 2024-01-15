#!/usr/bin/perl

use HTTP::Router::Declare;
use Plack::Request;

use MyApp::Index;
use MyApp::About;

use strict;
use warnings;

my $router = router {
    match '/', { method => 'GET' },
        to { controller => 'Index', action => 'handle' };
    match '/about', { method => 'GET' },
        to { controller => 'About', action => 'handle' };
};

sub {
    my $req   = Plack::Request->new(shift);

    my $match = $router->match($req)
        or return $req->new_response(404, undef, '404 From MyApp')->finalize;

    my $p = $match->params;
    my $controller = "MyApp::" . $p->{controller};
    my $action = $controller->can($p->{action})
        or return $req->new_response(405)->finalize;
    my $res = $controller->$action($req, $p);
    $res->finalize;
};