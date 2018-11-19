! Copyright (C) 2018 XZentus.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel sequences locals math math.functions math.primes math.primes.erato.fast ;
IN: e10

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

: extend-primes ( n primes -- primes' )
  [ 2dup last >= ]
  [ next-prime ] while nip ;
  
: solve ( limit -- primes sum )
  V{ 2 3 5 7 11 13 } extend-primes
  dup [ 0 [ + ] reduce ] [ last ] bi - ;
  
: solve-fast ( limit -- sieve sum )
  sieve dup sum ;
