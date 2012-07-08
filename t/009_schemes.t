use strict;
use warnings;
use Test::More tests=>5;
use URI::ImpliedBase;

my $base = URI::ImpliedBase->new("http://google.com");
my $relative = URI::ImpliedBase->new("/there.html");
is $relative->as_string, "http://google.com/there.html", "base set properly";

$relative = URI::ImpliedBase->new("mailto:sergey.brin\@gmail.com");
is $relative->as_string, "mailto:sergey.brin\@gmail.com", "mailto right";
$relative = URI::ImpliedBase->new("/there.html");
is $relative->as_string, "http://google.com/there.html", "base not reset by mailto";

push @URI::ImpliedBase::accepted_schemes, "ftp";
$relative = URI::ImpliedBase->new("ftp://source.google.com");
is $relative->as_string, "ftp://source.google.com", "ftp right";
$relative = URI::ImpliedBase->new("/there.html");
is $relative->as_string, "ftp://source.google.com/there.html", "base reset by ftp";


