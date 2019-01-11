! Copyright (C) 2019 XZentus.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel sequences locals math math.ranges arrays ;
IN: e21

: update-element ( n seq quot: ( a -- b ) -- )
  [ [ nth ] 2keep rot ] dip call -rot set-nth ; inline

:: init-divs-sums ( n -- arr )
  n 1 + 1 <array> :> arr
  2 n 2 / [a,b)
  [
    :> d
    d 2 * n d <range>
    [
      dup arr nth d + swap
      arr set-nth
    ] each
  ] each
  arr ;

: amicable? ( n seq -- ? )
  [ nth ] 2keep [ 2dup = not ] dip swap
  [ [ swap ] dip ?nth = ] [ 3drop f ] if ;

: solve ( -- result )
  10000 dup init-divs-sums swap
  <iota> [ over amicable? ] filter sum [ drop ] dip ;
