[![Actions Status](https://github.com/lizmat/Array-Sorted-Map/workflows/test/badge.svg)](https://github.com/lizmat/Array-Sorted-Map/actions)

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

AUTHOR
======

Elizabeth Mattijsen <liz@raku.rocks>

COPYRIGHT AND LICENSE
=====================

Copyright 2021 Elizabeth Mattijsen

Source can be located at: https://github.com/lizmat/Array-Sorted-Map . Comments and Pull Requests are welcome.

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

