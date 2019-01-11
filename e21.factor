! Copyright (C) 2019 XZentus.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel sequences locals math math.ranges arrays ;
IN: e21

:: init-divs-sums ( n -- divisor-sums )
  n 1 + 1 <array> :> arr
  2 n 2 / [a,b)
  [ :> d
    d 2 * n d <range>
    [ arr [ d + ] change-nth ] each
  ] each
  arr ;

: amicable? ( n seq -- ? )
  [ nth ] 2keep [ 2dup = not ] dip swap
  [ [ swap ] dip ?nth = ] [ 3drop f ] if ;

: (solve) ( n -- result )
  dup init-divs-sums swap <iota>
  [ over amicable? ] filter sum nip ;

: solve ( -- result )
  10000 (solve) ;
