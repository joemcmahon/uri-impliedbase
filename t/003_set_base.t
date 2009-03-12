# -*- perl -*-

# t/003_set_base.t - check that base is actually getting set

use Test::More tests => 3;

BEGIN { use_ok( 'URI::DefaultBased' ); }

my $object = URI::DefaultBased->new("http://blah.foo.com");
is(URI::DefaultBased->current_base, "http://blah.foo.com");

$object = URI::DefaultBased->new("http://bar.baz.com/test");
is(URI::DefaultBased->current_base, "http://bar.baz.com/test");
