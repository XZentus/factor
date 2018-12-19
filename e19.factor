! Copyright (C) 2018 XZentus.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel calendar math math.ranges sequences ;
IN: e19

: solve ( -- sundays )
  1901 2000 [a,b] [
      12 [1,b]
          [ 1 zeller-congruence ] with map
          [ zero? ] count
  ] [ + ] map-reduce ;
