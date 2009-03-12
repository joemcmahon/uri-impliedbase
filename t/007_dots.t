# -*- perl -*-

# t/006_relative3.t - check that dot and dot-dot work

use Test::More tests => 5;
use Cwd;

BEGIN { use_ok( 'URI::DefaultBased' ); }

my $object = URI::DefaultBased->new("./test");
is(URI::DefaultBased->current_base,"file://".getcwd()."/test");
is($object->as_string, "file://".getcwd()."/test");

$object = URI::DefaultBased->new("../junk.html");
my @midpath = split /\//,getcwd;
pop @midpath;
my $midpath = join '/', @midpath;
is($object->as_string, "file://$midpath/junk.html");

is(URI::DefaultBased->current_base,"file://".getcwd()."/test");
