-module(second).
-export([hypothenuse/2, perimeter/2, triArea/2]).
-import(first, [double/1, area/3, mult/2]).

sqare(A) ->
    mult(A,A).

hypothenuse(A, B) ->
math:sqrt(sqare(A)+sqare(B)).

perimeter(A, B) ->
A+B+hypothenuse(A,B).

triArea(A,B)->
    area(A,B,hypothenuse(A,B)).


