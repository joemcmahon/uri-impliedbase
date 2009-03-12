# -*- perl -*-

# t/005_relative2.t - check that we set the base from the cwd

use Test::More tests => 3;
use Cwd;

BEGIN { use_ok( 'URI::DefaultBased' ); }

my $object = URI::DefaultBased->new("./test");

is(URI::DefaultBased->current_base,"file://".getcwd()."/test");
is($object->as_string, "file://".getcwd()."/test");
