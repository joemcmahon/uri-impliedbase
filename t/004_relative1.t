# -*- perl -*-

# t/004_relative1.t - check that existing base is used for relative

use Test::More tests => 3;

BEGIN { use_ok( 'URI::DefaultBased' ); }

my $object = URI::DefaultBased->new("http://blah.foo.com");
is(URI::DefaultBased->current_base, "http://blah.foo.com");

$object = URI::DefaultBased->new("subdir/one");
is($object->as_string, "http://blah.foo.com/subdir/one");
