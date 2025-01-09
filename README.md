[![Actions Status](https://github.com/lizmat/Array-Sorted-Map/actions/workflows/linux.yml/badge.svg)](https://github.com/lizmat/Array-Sorted-Map/actions) [![Actions Status](https://github.com/lizmat/Array-Sorted-Map/actions/workflows/macos.yml/badge.svg)](https://github.com/lizmat/Array-Sorted-Map/actions) [![Actions Status](https://github.com/lizmat/Array-Sorted-Map/actions/workflows/windows.yml/badge.svg)](https://github.com/lizmat/Array-Sorted-Map/actions)

NAME
====

Array::Sorted::Map - Provide a Map interface for 2 sorted lists

SYNOPSIS
========

```raku
use Array::Sorted::Util;
use Array::Sorted::Map;

my @keys;
my @values;

inserts(@keys, "a", @values, 42);  # "inserts" from Array::Sorted::Util
inserts(@keys, "b", @values, 666);

my %map := Array::Sorted::Map.new(:$keys, :$values);

say %map<a>;  # 42;
say %map<b>;  # 666;
say %map<c>;  # Nil

say %map.keys;    # (a b)
say %map.values;  # (42 666)
```

DESCRIPTION
===========

Array::Sorted::Map provides a class that can be used to provide a `Map` interface to two sorted lists: one for keys, and one for values, such as typically created / maintained by the subroutines offered by the `Array::Sorted::Util` distribution.

Optionally, a `:cmp` argument can be specified, indicating the logic that should be used for comparing elements from the keys. By default, the `infix:<cmp>` will be assumed.

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Array-Sorted-Map . Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a [small sponsorship](https://github.com/sponsors/lizmat/) would mean a great deal to me!

COPYRIGHT AND LICENSE
=====================

Copyright 2021, 2024, 2025 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

