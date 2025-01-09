use Array::Sorted::Util:ver<0.0.11+>:auth<zef:lizmat>;

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

# vim: expandtab shiftwidth=4
