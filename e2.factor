! Copyright (C) 2018 Nex.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math locals ;
IN: e2

: next-fibs ( f1 f2 -- f2 f3 )
  dup -rot + ;
  
: next-sum-evens ( f1 f2 s1 -- f2 f3 s2 )
  [ next-fibs ] dip
  pick dup even?
  [ + ] [ drop ] if ;
  
:: solve ( limit -- f2 f3 s )
  0 1 0
  [ next-sum-evens dup limit < ] loop ;

: result ( -- result )
  4000000 solve [ 2drop ] dip ;
