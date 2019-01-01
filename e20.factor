! Copyright (C) 2019 XZentus.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math math.ranges sequences ;  
IN: e20

: digits-sum ( n -- sum )
  0 swap
  [ dup 0 > ]
  [ 10 /mod -rot [ + ] dip ]
  while drop ;
  
: factorial ( n -- n! )
  [1,b] 1 [ * ] reduce ;
  
: solve ( -- result )
  100 factorial digits-sum ;