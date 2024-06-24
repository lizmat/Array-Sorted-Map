use Array::Sorted::Util:ver<0.0.9>:auth<zef:lizmat>;

class Array::Sorted::Map does Associative {
    has $.keys   is built(:bind) is required
      handles <end elems Numeric Int Bool>;
    has $.values is built(:bind) is required;
    has &.cmp    is built(:bind) = &infix:<cmp>;

    method AT-KEY(\key) {
        (my $pos := finds($!keys, key, :&!cmp)).defined
          ?? $!values[$pos]
          !! Nil
    }

    method EXISTS-KEY(\key) { finds($!keys, key, :&!cmp).defined }

    method kv() {
        gather for ^$!keys.elems {
            take $!keys[$_];
            take $!values[$_];
        }
    }
    method anti-pairs() {
        (^$!keys.elems).map: -> int $i { $!values[$i] => $!keys[$i] }
    }
    method pairs() {
        (^$!keys.elems).map: -> int $i { $!keys[$i] => $!values[$i] }
    }
    method iterator() {
        self.pairs.iterator
    }
}

=begin pod

=head1 NAME

Array::Sorted::Map - Provide a Map interface for 2 sorted lists

=head1 SYNOPSIS

=begin code :lang<raku>

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

=end code

=head1 DESCRIPTION

Array::Sorted::Map provides a class that can be used to provide a C<Map>
interface to two sorted lists: one for keys, and one for values, such as
typically created / maintained by the subroutines offered by the
C<Array::Sorted::Util> distribution.

Optionally, a C<:cmp> argument can be specified, indicating the logic that
should be used for comparing elements from the keys.  By default, the
C<infix:<cmp>> will be assumed.

=head1 AUTHOR

Elizabeth Mattijsen <liz@raku.rocks>

Source can be located at: https://github.com/lizmat/Array-Sorted-Map .
Comments and Pull Requests are welcome.

If you like this module, or what I’m doing more generally, committing to a
L<small sponsorship|https://github.com/sponsors/lizmat/>  would mean a great
deal to me!

=head1 COPYRIGHT AND LICENSE

Copyright 2021, 2024 Elizabeth Mattijsen

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod

# vim: expandtab shiftwidth=4
