package CottageS;

use Mojo::Base qw( Mojolicious );

sub startup
{
   my $self = shift;
   my $config = $self->plugin('config', file => 'CottageS.conf' );
   $self->secrets( @{ $config->{secrets} } );

## Routes
   my $r = $self->routes;

   $r->any( '/guestbook' )->to(
      template         => 'guestbook',
      meta_description => "guestbook for the beach house",
      meta_keywords    => "vacation, cottage, guestbook, reviews",
      title            => "Guestbook"
   );

   $r->any( '/amenities' )->to(
      template         => 'amenities',
      meta_description => "amenities of the beach house",
      meta_keywords    => "vacation, cottage, amenities",
      title            => "Amenities"
   );

   $r->any( '/attractions' )->to(
      template         => 'attractions',
      meta_description => "local attractions near the beach house",
      meta_keywords    => "local, vacation, cottage, attractions",
      title            => "Local attractions"
   );

   $r->any( '/gallery/boardwalk' )->to(
      template         => 'gallery',
      images           => $config->{gallery_boardwalk},
      meta_description => "Photos of the Presquile boardwalk trail",
      meta_keywords    => "vacation, cottage, rental, gallery, nature, marsh, birding",
      title            => "Presquile boardwalk trail"
   );

   $r->any( '/gallery/house' )->to(
      template         => 'gallery',
      images           => $config->{gallery_house},
      meta_description => "Photos The Waves vaction rental",
      meta_keywords    => "vacation, cottage, rental, gallery",
      title            => "The Waves vacation house"
   );

   $r->any( '/gallery/winter' )->to(
      template         => 'gallery',
      images           => $config->{gallery_winter},
      meta_description => "Photos The Waves vaction rental",
      meta_keywords    => "vacation, cottage, rental, gallery",
      title            => "The Waves vacation house"
   );

   $r->any( '/' )->to(
      template         => 'home',
      images           => $config->{carousel},
      meta_description => "vacation cottage rental on the shore of lake ontario",
      meta_keywords    => "vacation, cottage, rental, beach, lake shore, ontario",
      title            => ""
      );

   # a Catchall, make last
   $r->any( '/*' )->to(
      template         => 'home',
      images           => $config->{carousel},
      meta_description => "vacation cottage rental on the shore of lake ontario",
      meta_keywords    => "vacation, cottage, rental, beach, lake shore, ontario",
      title            => ""
      );
}

1;

=pod

=head1 SYNOPSIS

Main app.

=head1 LICENSE

Copyright (C) 2014 Neil H Watson

=cut
