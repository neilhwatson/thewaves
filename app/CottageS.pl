#!/usr/bin/env perl

use FindBin;
require Mojolicious::Commands;

BEGIN { unshift @INC, "$FindBin::Bin/lib" }

Mojolicious::Commands->start_app('CottageS');
