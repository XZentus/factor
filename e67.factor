! Copyright (C) 2018 XZentus.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math math.ranges math.parser math.order locals vectors sequences
       splitting io.files io.encodings.utf8 ;
IN: e67

: triangle ( -- triangle )
  "work/e67/p067_triangle.txt" utf8 file-lines
  [ " " split [ string>number ] map ] map ;

:: step-line ( seq1s seq2 -- seq2s )
  seq1s seq2 [ first ] bi@ + 1vector :> result

  seq2 length 1 - [1,b)
  [
      dup dup
      [ seq2 nth ] 2dip
      1 - [ seq1s nth ] bi@ max
      + result swap suffix! drop
  ] each

  result seq1s seq2 [ last ] bi@ + suffix! ;

: solve ( -- result )
  triangle [ 1 tail ] [ first ] bi
  [ step-line ] reduce supremum ;
