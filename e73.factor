! Copyright (C) 2018 XZentus.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math math.functions math.ranges sequences ;
IN: e73

: next-ratio1/3 ( d -- n/d )
  [
    dup 3 mod zero? [ 1 + ] when
    3 / ceiling
  ] keep / ;

: (1/3;1/2) ( d -- range )
  [ next-ratio1/3 99,999/200,000 1 ] keep / <range> ;

: solve ( -- result )
  3 12000 [a,b]
  [
    dup
    (1/3;1/2) [ denominator over = ] filter
    [ drop ] dip
    length
  ]
  [ + ] map-reduce ;
