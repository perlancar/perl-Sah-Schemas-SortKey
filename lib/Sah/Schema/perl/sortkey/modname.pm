package Sah::Schema::perl::sortkey::modname;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = ['str' => {
    summary => 'Perl SortKey::* module name without the prefix, e.g. Num/pattern_count',
    description => <<'_',

Contains coercion rule so you can also input `Foo-Bar`, `Foo/Bar`, `Foo/Bar.pm`
or even 'Foo.Bar' and it will be normalized into `Foo::Bar`.

_
    match => '\A[A-Za-z_][A-Za-z_0-9]*(::[A-Za-z_0-9]+)*\z',

    'x.perl.coerce_rules' => [
        'From_str::normalize_perl_modname',
    ],

    # provide a default completion which is from list of installed perl modules
    'x.completion' => ['perl_modname', {ns_prefix=>'SortKey'}],

    examples => [
        {value=>'', valid=>0},
        {value=>'Num/pattern_count', valid=>1, validated_value=>'Num::pattern_count'},
        {value=>'pattern count', valid=>0},
    ],

}];

1;
# ABSTRACT:
