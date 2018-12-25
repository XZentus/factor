! Copyright (C) 2018 XZentus.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math math.parser locals splitting sequences generalizations
       io.files io.encodings.ascii ;
IN: e102

! (y1 - y2)x + (x2 - x1)y + (x1y2 - x2y1) = 0
: check-equation ( x1 y1 x2 y2 -- n )
   -rot [ * ] 2bi@ - ; inline

: extract-points ( i0 i1 pts -- x y x y )
  [ [ [ 2 * ] [ 2 * 1 + ] bi ] bi@ ] dip
  [ nth ] curry 4 napply ;

: (ch-eq) ( seq p0 p1 -- ? )
  extract-points check-equation 0 > ; inline

:: check-triangle ( seq -- ? )
  0 1 seq (ch-eq)
  1 2 seq (ch-eq) [ = ] keep
  2 0 seq (ch-eq)   =   and ;

: parse-line ( str -- seq )
  "," split [ string>number ] map ;

: read-file ( -- file-lines )
  "work/e102/p102_triangles.txt" ascii file-lines ;

: solve ( -- result )
  read-file [ parse-line check-triangle 1 0 ? ] [ + ] map-reduce ;
