use strict;
use warnings;
use Test2::V0;
use lib 'lib';
use TestQuery ':ALL';

my $query = parse_query_string('name=Ovid&color=black');
is $query, { name => ['Ovid'], color => ['black'] },
  'A basic query string parsing should be correct';
$query = parse_query_string('color=blue&color=white&color=red');
is $query, { color => [qw/blue white red/] },
  '... and multi-valued params should also parse correctly';
$query = parse_query_string('color=blue;color=white;color=red');
is $query, { color => [qw/blue white red/] },
  '... even if we are using the alternate ";" delimiter';
$query = parse_query_string('remark=%28parentheses%21%29');
is $query, { remark => ['(parentheses!)'] },
  '... or URI-encoded characters';
my $omega = "\N{U+2126}";
$query = parse_query_string('alpha=%E2%84%A6');
is $query, { alpha => [$omega] },
  '... and Unicode should decode correctly';

done_testing;
