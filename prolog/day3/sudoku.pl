
sudoku(Puzzle,Solution) :- 
	Puzzle = Solution,
	% list_size(Puzzle,16),
	valid_numbers(Puzzle),
	Puzzle = 
		[
			S11,S12,S13,S14,
			S21,S22,S23,S24,
			S31,S32,S33,S34,
			S41,S42,S43,S44
		],
	% rows
	uniqueness(S11,S12,S13,S14),
	uniqueness(S21,S22,S23,S24),
	uniqueness(S31,S32,S33,S34),
	uniqueness(S41,S42,S43,S44),
	% columns
	uniqueness(S11,S21,S31,S41),
	uniqueness(S12,S22,S32,S42),
	uniqueness(S13,S23,S33,S43),
	uniqueness(S14,S24,S34,S44),
	% squares
	uniqueness(S11,S12,S21,S22),
	uniqueness(S13,S14,S23,S24),
	uniqueness(S31,S32,S41,S42),
	uniqueness(S33,S34,S43,S44).


list_size([],0).
list_size([_|T],R) :- list_size(T,R2), R is R2+1.

valid_numbers([]).
valid_numbers([H|T]) :- valid_number(H), valid_numbers(T).
valid_number(X) :- sudoku_number(X).

sudoku_number(1).
sudoku_number(2).
sudoku_number(3).
sudoku_number(4).

uniqueness(W,X,Y,Z) :-
	W \= X,
	W \= Y,
	W \= Z,
	X \= Y,
	X \= Z,
	Y \= Z.