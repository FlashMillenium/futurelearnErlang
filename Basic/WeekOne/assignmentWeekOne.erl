-module(assignmentWeekOne).
-export([perimeter/1, bits/1, area/1, enclose/1]).
-import(math, [sqrt/1]).
-import(lists, [append/2]).

%% shape structure be: {shape, [[x1,y1], [x2,y2], etc]}

%% distance between two point in 2 dimensional space
distance([X1,Y1],[X2,Y2]) ->
    sqrt((X2-X1)*(X2-X1)+(Y2-Y1)*(Y2-Y1)).


%% recursive calculate distance between point with two list 
%% (first - original point of shape, second - list when first element become last)
perimeter([],[], Res)-> Res;
perimeter([X|XTail],[Y|YTail], Res)->  
    perimeter(XTail,YTail, Res+distance(X,Y)).


perimeter({triangle, [[X1,Y1],[X2,Y2],[X3,Y3]]}) -> 
    sqrt((X2-X1)*(X2-X1)+(Y2-Y1)*(Y2-Y1)) +
    sqrt((X3-X2)*(X3-X2)+(Y3-Y2)*(Y3-Y2)) +
    sqrt((X1-X3)*(X1-X3)+(Y1-Y3)*(Y1-Y3));
perimeter({shape, [HeadPoint|TailPoints]}) ->
perimeter(append([HeadPoint],TailPoints), append(TailPoints,[HeadPoint]), 0).

%% I think best representation for triangle is list with 3 point. {triangle, [[x1,y1],[x2,y2],[x3,y3]]}
%% If you need to draw this on screen is the best information to you can get. 
%% for perimeter i thing is best get distance between this points, and i need to calculate this information.
%% and for area i will youse Heron's formula 
%% if structure known, i can hardcode all calculation, just...beacause i can. 

area({triangle, [[X1,Y1],[X2,Y2],[X3,Y3]]}) ->
    P = perimeter({triangle, [[X1,Y1],[X2,Y2],[X3,Y3]]}),
   sqrt(P*(P-distance([X1,Y1],[X2,Y2]))*(P-distance([X3,Y3],[X1,Y1]))*(P-distance([X2,Y2],[X3,Y3]))).


%% enclose return structure with two point {rectangle, [[X1,Y1],[X2,Y2]]}
%%  may be problem with shell number output - they may be char, instead of number
%% i can solve this output with ~w in io:format, but i need return structure, not string in shell.
enclose([], Res) -> Res;
enclose([[X,Y]|TailPoints], {rectangle, [[X1,Y1],[X2,Y2]]}) -> 
    MinX = if X1<X -> X1;
              true -> X
           end,
    MinY = if Y1<Y -> Y1;
              true -> Y
            end,
    MaxX = if X2>X -> X2;
              true -> X
           end,
    MaxY = if Y2>Y -> Y2;
              true -> Y
           end,
    enclose(TailPoints, {rectangle, [[MinX,MinY],[MaxX,MaxY]]}).        

enclose({shape, Points}) -> enclose(Points, {rectangle, [[0,0],[0,0]]}).

%% we count remainder on division to 2 until result is 1
%% and i don't get idea about tail and usual recursion in this task, i can create only this solution.
bits(1,Res)-> Res+1;
bits(Div, Res)-> bits(Div div 2, Res+Div rem 2).

bits(N) -> bits(N,0).