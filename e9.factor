! Copyright (C) 2018 XZentus.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math math.ranges prettyprint io sequences ;
IN: e9

: a-range ( -- range )
  334 [1,b] ;

: b-range ( a -- range )
  dup 1000 swap - 2 / [a,b] ;

: pprint-abc ( a b c -- )
  3dup
  pprint "^2 = " write pprint "^2 + " write pprint "^2" print
  * * pprint nl ;

: solve ( -- )
  a-range [
    dup 1 + b-range [
      [ dup ] dip
      2dup 1000 -rot + - ! a b c
      3dup
      [ sq ] tri@ [ + ] dip =
      [ pprint-abc ]
      [ 3drop ] if
    ] each
    drop
  ] each ;
