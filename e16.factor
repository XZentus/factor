2 1000 ^ number>string string>digits sum
0 2 1000 ^ [ dup 0 = ] [ 10 /mod pick + swap [ drop ] 2dip ] until drop .
