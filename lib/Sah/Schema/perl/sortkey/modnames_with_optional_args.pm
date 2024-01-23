package Sah::Schema::perl::sortkey::modnames_with_optional_args;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

our $schema = [array => {
    summary => 'Array of Perl SortKey::* module names without the prefix, with optional args, e.g. ["Num::length", "Num::pattern_count=pattern,foo"]',
    description => <<'_',

Array of Perl SortKey::* module names without the prefix and with optional
args. Each element is of `perl::sortkey::modname` schema, e.g. `Num::length`,
`Num::pattern_count`.

Contains coercion rule that expands wildcard, so you can specify:

    Num::*

and it will be expanded to e.g.:

    ["Num::length", "Num::pattern_count"]

The wildcard syntax supports jokers (`?`, `*`, `**`), brackets (`[abc]`), and
braces (`{one,two}`). See <pm:Module::List::Wildcard> for more details.

_
    of => ["perl::sortkey::modname_with_optional_args", {req=>1}],

    'x.perl.coerce_rules' => [
        ['From_str_or_array::expand_perl_modname_wildcard', {ns_prefix=>'SortKey'}],
    ],

    # provide a default completion which is from list of installed perl modules
    'x.element_completion' => ['perl_sortkey_modname_with_optional_args'],

}];

1;
# ABSTRACT:
