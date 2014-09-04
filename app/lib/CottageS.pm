package CottageS;

use Mojo::Base qw( Mojolicious );

sub startup
{
   my $self = shift;
   my $config = $self->plugin('config', file => 'CottageS.conf' );
   $self->secrets( @{ $config->{secrets} } );

## Routes
   my $r = $self->routes;

   $r->any( '/' )->to( template => 'home', images => $config->{carousel} );
   $r->any( '/gallery' )->to( template => 'gallery', images => $config->{gallery} );
}

1;

=pod

=head1 SYNOPSIS

Main app.

=head1 LICENSE

Copyright (C) 2014 Neil H Watson

=cut
