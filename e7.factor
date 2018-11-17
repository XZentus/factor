! Copyright (C) 2018 Nex.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel sequences locals math math.functions ;
IN: e7

: pred-loop ( num div --  num divisor? continue? )
  [ dup ] dip
  [ divisor? ] [ sq > ] 2bi over or ;
  
:: body-loop ( seq i p? div? -- seq i' p'? div )
  seq div?
  [ 1 p? 2 + 2 ]
  [ i 1 + p? i seq ?nth ]
  if ;

: next-prime ( primes -- primes+next )
  dup last 2 + 1 swap 2
  [ pred-loop ] [ body-loop ] while
  drop [ drop ] dip
  suffix ;

: nth-prime ( init-primes n -- primes' prime )
  [ dup length ] dip swap - 1 +
  [ next-prime ] times
  dup last ;
  
: solve ( -- primes n )
  V{ 2 3 5 7 11 13 } 10001 nth-prime ;
