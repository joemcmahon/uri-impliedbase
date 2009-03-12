# -*- perl -*-

# t/006_relative3.t - check that base gets set for relative path firstr

use Test::More tests => 3;
use Cwd;

BEGIN { use_ok( 'URI::DefaultBased' ); }

my $object = URI::DefaultBased->new("test");
is(URI::DefaultBased->current_base,"file://".getcwd()."/test");
is($object->as_string, "file://".getcwd()."/test");


