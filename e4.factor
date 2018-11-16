! Copyright (C) 2018 Nex.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math math.ranges math.parser sequences locals math.order ;
IN: e4

: is-num-palindrome ( num -- ? )
  number>string dup reverse = ;

: check-pal ( p1 a p2 -- p1/p2_max a )
  rot max swap ;
  
 
:: solve ( from to -- n )
  0 from to [a,b] [
      dup to [a,b] [
          over * dup is-num-palindrome
              [ check-pal ]
              [ drop ] if
          ] each
          drop
      ] each ;
