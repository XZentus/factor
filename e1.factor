! Copyright (C) 2018 Nex.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math math.functions fry syntax ;
IN: e1
 
: next-divisor ( n d -- n )
  2dup rem dup 0 = [ 2drop ] [ - + ] if ;
 
: prev-divisor ( n d -- n )
  over swap rem - ;
 
: middle-num ( mn mx -- n )
  + 2 / ; 
  
: count-n-divs ( mn mx n -- n )
  [ swap - ] dip / 1 + ;
 
: count-divs-sum ( mn mx n -- s )
  [ 2dup middle-num -rot ] dip count-n-divs * ;
  
: sdivsn ( n -- curry )
  dup dup
    '[ [ _ next-divisor ] [ _ prev-divisor ] bi*
         _ count-divs-sum  ] ;

: sdivsn-call ( m n d -- s )
  sdivsn call( m n -- s ) ;

: sdivs15 ( m n -- s )
  15 sdivsn-call ;
 
: sdivs5 ( m n -- s )
  5 sdivsn-call ;
 
: sdivs3 ( m n -- s )
  3 sdivsn-call ;
 
: solve ( min max -- sum )
  [ sdivs15 ]
  [ sdivs5  ]
  [ sdivs3  ] 2tri + swap - ;
