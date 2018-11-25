! Copyright (C) 2018 XZentus.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math math.functions math.ranges sequences bit-arrays locals namespaces ;
IN: erast-builder

<PRIVATE

SYMBOLS: SIZE SIEVE ;

: (init-array) ( size -- {ttt...} )
    dup SIZE set
    <bit-array> dup set-bits ;

:: unset-divisors ( seq n -- )
    n sq SIZE get 1 - n <range>
    [ f swap seq set-nth ] each ;

PRIVATE>

: next-prime ( n -- prime )
    [
        1 +
        dup SIZE get >=
        [ drop "ERROR: sieve is over" f ]
        [ dup SIEVE get ?nth not ] if
    ] loop ;

: sieve-size ( -- size )
    SIZE get ;

: get-sieve ( -- sieve )
    SIEVE get ;

:: build-sieve ( size -- sieve )
    size (init-array) :> arr
    arr 2 unset-divisors
    3 SIZE get sqrt >integer 2 <range>
    [ arr swap unset-divisors ] each
    arr dup SIEVE set ;
