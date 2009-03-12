# -*- perl -*-

# t/001_load.t - check module loading and create testing directory

use Test::More tests => 2;

BEGIN { use_ok( 'URI::DefaultBased' ); }

my $object = URI::DefaultBased->new ();
isa_ok ($object, 'URI::_generic');


