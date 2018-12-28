! Copyright (C) 2018 XZentus.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math math.primes.factors math.ranges sequences ;
IN: e72

: (fractions[a,b]) ( from to -- fracs )
  [a,b] [ totient ] [ + ] map-reduce ;

: solve ( -- result )
  2 1,000,000 (fractions[a,b]) ;
