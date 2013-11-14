% reversing a list
reverse_items([],List,List).
reverse_items([Head|Tail],Accumulator,Reverse) :- 
	reverse_items(Tail, [Head|Accumulator], Reverse).
do_reverse(List, Reverse) :- reverse_items(List, [], Reverse).

% finding the min of a list
min_item([M],M).
min_item([Head|Tail],Head) :- min_item(Tail,Y), Head =< Y.
min_item([Head|Tail],Y) :- min_item(Tail,Y), Y < Head.

% sorting a list
sort_list(List,Sorted) :- i_sort_list(List, [], Sorted).
i_sort_list([],Acc,Acc).
i_sort_list([H|T],Acc,S) :- insert(H,Acc,Acc2), i_sort_list(T,Acc2,S).
insert(Item,[],[Item]).
insert(Item,[Y|Acc],[Item,Y|Acc]) :- Item=<Y.
insert(Item,[Y|Acc],[Y|Acc2]) :- Item>Y, insert(Item,Acc,Acc2).

% towers of hanoi
hanoi(1,P1,P2,_) :-
	write('Move top disk from '),
	write(P1),
	write(' to '),
	write(P2),
	nl.
hanoi(N,P1,P2,P3) :-
	N>1,
	M is N-1,
	hanoi(M,P1,P3,P2),
	hanoi(1,P1,P2,_),
	hanoi(M,P3,P2,P1).

% fib
fib(0,0).
fib(1,1).
fib(N,R) :- 
	N>1, 
	N1 is N-1,
	N2 is N-2,
	fib(N1,R1), 
	fib(N2,R2), 
	R is R1+R2.