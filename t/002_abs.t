# -*- perl -*-

# t/002_abs.t - check absolute URIs`

use Test::More tests => 5;

BEGIN { use_ok( 'URI::DefaultBased' ); }

my $object = URI::DefaultBased->new ('http://search.cpan.org');
isa_ok ($object, 'URI::_generic');
is($object->as_string, "http://search.cpan.org");
$object = URI::DefaultBased->new ('file://Users/joe/lib');
isa_ok ($object, 'URI::_generic');
is($object->as_string, "file://Users/joe/lib");


