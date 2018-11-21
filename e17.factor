! Copyright (C) 2018 XZentus.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel vectors sequences math math.ranges locals make ;
IN: e16

: nums-written ( -- vec )
  V{ "zero"
     "one"     "two"       "three"    "four"     "five"
     "six"     "seven"     "eight"    "nine"     "ten"
     "eleven"  "twelve"    "thirteen" "fourteen" "fifteen"
     "sixteen" "seventeen" "eighteen" "nineteen" } ; foldable
     
: tens-written ( -- vec )
  V{ ""
     "ten"   "twenty"  "thirty" "forty" "fifty"
     "sixty" "seventy" "eighty" "ninety" } ; foldable
     
: nums-len ( -- vec )
  nums-written [ length ] map ; foldable
  
: tens-len ( -- vec )
  tens-written [ length ] map ; foldable
  
: 1-9sum ( -- sum )
  9 [1,b] [ nums-len ?nth ] [ + ] map-reduce ; foldable

: 10-90sum ( -- sum )
  1 tens-len ?nth 
  2 9 [a,b] [ tens-len ?nth 10 * ] [ + ] map-reduce + ; foldable

: 100sum ( -- sum )
  "hundred" length ; foldable

: 100and ( -- sum )
  "hundredand" length ; foldable
  
: 100-900 ( -- sum )
  9 [1,b] [ nums-len ?nth 100and + 99 * ] [ + ] map-reduce
  9 [1,b] [ nums-len ?nth 100sum + ] [ + ] map-reduce
  + ; foldable

:: solve ( -- result )
  [ 
    1-9sum 9 10 * * ,
    11 19 [a,b] [ nums-len ?nth ] [ + ] map-reduce 10 * ,
    10-90sum 10 * ,
    100-900 ,
    "onethousand" length ,
  ] { } make sum ;
