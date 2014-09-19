use Test::More;
use Test::Mojo;

my $t = Test::Mojo->new('CottageS');

$t->ua->max_redirects(1);

$t->get_ok('/')
 ->status_is(200, 'Load /home' )
 ->text_is( 'html body div div div a', 'The Waves Beach House',
    '/home First menu item' )

 ->content_like( qr/A convenient location/ms,
    '/home features list')

 ->content_like( qr/of Lake Ontario/ms, 
    '/home local attractions list')

 ->content_like( qr/46 Greenway/ms, 
    '/home address');

done_testing();

=pod

=head1 SYNOPSIS

This is for testing the home page.

=head1 LICENSE

Copyright (C) 2014 Neil Watson

=cut
