
sudoku(Puzzle,Solution) :- 
	Puzzle = Solution,
	valid_numbers(Puzzle),
	Puzzle = 
		[
			S11,S12,S13,S14,S15,S16,
			S21,S22,S23,S24,S25,S26,
			S31,S32,S33,S34,S35,S36,
			S41,S42,S43,S44,S45,S46,
			S51,S52,S53,S54,S55,S56,
			S61,S62,S63,S64,S65,S66
		],
	% rows
	uniqueness(S11,S12,S13,S14,S15,S16),
	uniqueness(S21,S22,S23,S24,S25,S26),
	uniqueness(S31,S32,S33,S34,S35,S36),
	uniqueness(S41,S42,S43,S44,S45,S46),
	uniqueness(S51,S52,S53,S54,S55,S56),
	uniqueness(S61,S62,S63,S64,S65,S66),
	% columns
	uniqueness(S11,S21,S31,S41,S51,S61),
	uniqueness(S12,S22,S32,S42,S52,S62),
	uniqueness(S13,S23,S33,S43,S53,S63),
	uniqueness(S14,S24,S34,S44,S54,S64),
	uniqueness(S15,S25,S35,S45,S55,S65),
	uniqueness(S16,S26,S36,S46,S56,S66),
	% squares
	uniqueness(S11,S12,S13,S21,S22,S23),
	uniqueness(S14,S15,S16,S24,S25,S26),
	uniqueness(S31,S32,S33,S41,S42,S43),
	uniqueness(S34,S35,S36,S44,S45,S46),
	uniqueness(S51,S52,S53,S61,S62,S63),
	uniqueness(S54,S55,S56,S64,S65,S66).


list_size([],0).
list_size([_|T],R) :- list_size(T,R2), R is R2+1.

valid_numbers([]).
valid_numbers([H|T]) :- valid_number(H), valid_numbers(T).
valid_number(X) :- sudoku_number(X).

sudoku_number(1).
sudoku_number(2).
sudoku_number(3).
sudoku_number(4).
sudoku_number(5).
sudoku_number(6).

i_uniqueness(Item1,[Item2]) :- Item1 \= Item2.
i_uniqueness(Item,[Head|Tail]) :- 
	Item \= Head, 
	uniqueness(Item,Tail),
	uniqueness(Head,Tail).

uniqueness([]).
uniqueness([_]).
uniqueness([Head|Tail]) :- i_uniqueness(Head,Tail).

/*
uniqueness(W,X,Y,Z) :-
	W \= X,
	W \= Y,
	W \= Z,
	X \= Y,
	X \= Z,
	Y \= Z.
	*/
