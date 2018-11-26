! Copyright (C) 2018 XZentus.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math math.order math.functions math.ranges math.combinatorics sequences sets vectors locals io prettyprint ;

USING: erast-builder ;

IN: e51

: seq-places>number ( digits powers -- number )
    [ 10 swap ^ * ] [ + ] 2map-reduce ;
    
: dig-places>number ( digit powers -- number )
    [ 10 swap ^ over * ] map
    0 [ + ] reduce [ drop ] dip ;

: number>array ( number -- array )
    10 <vector> swap 
    [
        10 /mod
        [ over ] dip suffix! drop
        dup 0 >
    ] loop drop reverse ;

: check-pattern ( n1 n2 sieve -- prime? )
    [ + ] dip ?nth ;

:: count-n1-primes ( n1 n2places -- n-primes )
    0 10 <iota> 
    [
        n2places dig-places>number
        n1 + get-sieve ?nth
        [ 1 + ] when
    ] each ;

: pprint-result ( n1 count -- )
    pprint " : " write pprint nl ;

:: count-numbers-const-pattern ( pat1 pat2 -- max-prime-count )
    10 pat1 length 1 - dup 1 +
    [ [ ^ ] curry ] bi@ bi 1 -
    [a,b]
    [
        number>array pat1 seq-places>number :> n1
        n1 pat2 count-n1-primes             :> c
        c 8 >=
        [ n1 c pprint-result ] when
        c
    ] [ max ] map-reduce ;

:: count-patterns ( digits replaces -- max-prime-count )
    digits [1,b) replaces <combinations>
    [   
        digits <iota> over diff swap
        count-numbers-const-pattern
    ] map supremum ;

: solve ( -- answer )
    10000000 build-sieve drop
    6 3 count-patterns ;
