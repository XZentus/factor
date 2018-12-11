! Copyright (C) 2018 XZentus.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math locals math.ranges sequences prettyprint io ;
IN: e85

: n-figs ( sx sy a b -- n )
  [ swap ] dip [ - 1 + ] 2bi@ * ;

:: sum-figs ( x y -- n )
  x [1,b] [ :> cx
    y [1,b] [
      [ x y cx ] dip n-figs
    ] map-sum 
  ] map-sum ;
  
: target ( -- n )
  2,000,000 ;
  
: abs-diff ( x y -- adiff )
  - abs ;
  
:: solve ( from to -- x y target-diff )
  target 0 0 :> ( mindiff! minx! miny! )
  from to [a,b] [| x |
    x to [a,b] [| y |
      x y sum-figs target abs-diff :> diff
      diff mindiff < [ diff mindiff!
                          x minx!
                          y miny! ] when
    ] each
  ] each
  
  mindiff minx miny ;
  
! 1 150 solve * ! drop