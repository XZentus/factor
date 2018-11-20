! Copyright (C) 2018 XZentus.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math math.primes.factors sequences ;
IN: e12

: next-triang ( n triang -- n' next )
  over + [ 1 + ] dip ;
  
: init-triang ( -- n triang )
  8 28 ;
  
: enough-divisors? ( n -- ? )
  divisors length 500 > ;
  
: solve ( -- result )
  init-triang
  [ dup enough-divisors? ]
  [ next-triang ] until
  nip ;
  
