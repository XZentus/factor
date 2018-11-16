! Copyright (C) 2018 Nex.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math combinators ;
IN: e3

: divs-n ( n d -- n/d^x d )
  [ 2dup { [ > ] [ mod 0 = ] } 2cleave and ] [ dup [ / ] dip ] while ;

: get-largest-prime ( num -- prime )
  2 divs-n drop
  3 [ 2dup <= ] [ divs-n 2 + ] until drop ;
