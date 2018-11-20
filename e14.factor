! Copyright (C) 2018 XZentus.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel memoize math namespaces assocs locals math.ranges math.order sequences ;
IN: e14

SYMBOL: db

: collatz-next ( prev -- next )
  dup even? [ 2 / ] [ 3 * 1 + ] if ;
  
: collatz-len ( n -- i )
  dup db get at*
  [ [ drop ] dip ]
  [ 
    drop
    dup collatz-next collatz-len 1 + ! n i
    [ swap db get set-at ] keep
  ] if ; recursive


: init ( -- )
  H{ { 1 1 } { 2 2 } { 4 3 } } db set ;

: get-db ( -- db )
  db get ;
  
: solve ( -- n )
  init 1000000 [1,b) [ collatz-len ] [ max ] map-reduce ;

: collatz-len-simple ( n -- i )
  dup 1 = 
  [ 
    collatz-next collatz-len 1 + 
  ] unless ; recursive
  
: solve-simple ( -- n )
  1000000 [1,b) [ collatz-len-simple ] [ max ] map-reduce ;
