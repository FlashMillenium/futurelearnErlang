-module(recursion).
-export([fac/1, fib/1, pieces/1, perfect/1]).

fac(0) -> 1;
fac(N) when N>0 -> fac(N-1)*N.

fib(0, _F1, F2) -> F2;
fib(N, F1, F2) when N>0-> fib(N-1, F2, F1+F2).

fib(0) -> 0;
fib(1) -> 1;
fib(N) when N>0 -> fib(N-1, 0, 1).

pieces(0)->1;
pieces(N) when N>0 -> N + pieces(N-1).


perfect(0, _I, Num, Num)  -> true;
perfect(0, _I, _Num, _Sum) -> false;
perfect(N, I, Num, Sum) when (Num rem I) ==0 -> perfect(N-1,I+1, Num, Sum+I);
perfect(N, I, Num, Sum) ->perfect(N-1,I+1, Num, Sum).

perfect(1)-> true;
perfect(2)-> false;
perfect(N)-> perfect(N-2,1,N,0).
