! Copyright (C) 2018 XZents.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math math.ranges math.primes math.primes.factors sequences arrays ;
IN: e69

: phi ( n -- phi(n) )
  dup prime? [ 1 - ]
  [ dup unique-factors [ [ 1 1 ] dip / - ] [ * ] map-reduce * ] if ;

: n/phi ( n -- n/phi )
  dup phi / ;

: solve ( from to -- {n,n/phi} )
  [a,b]
  [ dup n/phi 2array ]
  [ [ [ second ] bi@ > ] 2keep ? ] map-reduce ;
