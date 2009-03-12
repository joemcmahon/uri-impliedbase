# -*- perl -*-

# t/008_clear.t - check that override and clear() work

use Test::More tests => 8;
use Cwd;

BEGIN { use_ok( 'URI::DefaultBased' ); }

my $object = URI::DefaultBased->new("./test");
is(URI::DefaultBased->current_base,"file://".getcwd()."/test");
is($object->as_string, "file://".getcwd()."/test");

URI::DefaultBased->clear();
is(URI::DefaultBased->current_base,"");

$object=URI::DefaultBased->new("./to_clobber");
$object = URI::DefaultBased->new("../junk.html");
my @midpath = split /\//,getcwd;
pop @midpath;
my $midpath = join '/', @midpath;
is($object->as_string, "file://$midpath/junk.html");

is(URI::DefaultBased->current_base,"file://".getcwd()."/to_clobber");

$object=URI::DefaultBased->new("http://use.perl.org");
is(URI::DefaultBased->current_base,"http://use.perl.org");
$object = URI::DefaultBased->new("junk.html");
is($object->as_string, "http://use.perl.org/junk.html");

