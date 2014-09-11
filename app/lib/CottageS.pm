package CottageS;

use Mojo::Base qw( Mojolicious );

sub startup
{
   my $self = shift;
   my $config = $self->plugin('config', file => 'CottageS.conf' );
   $self->secrets( @{ $config->{secrets} } );

## Routes
   my $r = $self->routes;

   $r->any( '/' )->to(
      template         => 'home',
      images           => $config->{carousel},
      meta_description => "vacation cottage rental on the shore of lake ontario",
      meta_keywords    => "vacation, cottage, rental, beach, lake shore, ontario",
      title            => "Brighton beach house vacation rental"
      );

   $r->any( '/gallery' )->to(
      template         => 'gallery',
      images           => $config->{gallery},
      meta_description => "brighton beach house gallery",
      meta_keywords    => "vacation, cottage, rental, gallery",
      title            => "Gallery"
   );
}

1;

=pod

=head1 SYNOPSIS

Main app.

=head1 LICENSE

Copyright (C) 2014 Neil H Watson

=cut
