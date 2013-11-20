valid_queen((_, Col)) :-
	member(Col, [1,2,3,4,5,6,7,8]).

valid_board([]).
valid_board([Head|Tail]) :- 
	valid_queen(Head),
	valid_board(Tail).

	/*
rows([],[]).
rows([(Row,_)|QueensTail], [Row|RowsTail]) :-
	rows(QueensTail, RowsTail).
	*/

cols([],[]).
cols([(_,Col)|QueensTail], [Col|ColsTail]) :-
	cols(QueensTail, ColsTail).

diags1([],[]).
diags1([(Row,Col)|QueensTail],[Diagonal|DiagsTail]) :-
	Diagonal is Col - Row,
	diags1(QueensTail,DiagsTail).

diags2([],[]).
diags2([(Row,Col)|QueensTail],[Diagonal|DiagsTail]) :-
	Diagonal is Col + Row,
	diags2(QueensTail,DiagsTail).

eight_queens(Board) :- 
	Board = [(1,_), (2,_), (3,_), (4,_), (5,_), (6,_), (7,_), (8,_)],
	% length(Board, 8),
	valid_board(Board),

	%rows(Board,Rows),
	cols(Board,Cols),
	diags1(Board,Diags1),
	diags2(Board,Diags2),

	% fd_all_different(Rows),
	fd_all_different(Cols),
	fd_all_different(Diags1),
	fd_all_different(Diags2).

n_rows(Queens,Rows) :-
	i_n_rows(Queens,1,Rows).
i_n_rows([_|QT],Count,[Count|Rows]) :-
	C2 is Count + 1,
	i_n_rows(QT,C2,Rows).
i_n_rows([_],Count,[Count]).

n_tuples([Row|Rows],[Col|Cols],[(Row,Col)|Tuples]) :-
	n_tuples(Rows,Cols,Tuples).
n_tuples([],[],[]).

i_n_valid_board([],_).
i_n_valid_board([Col|Cols],Rows) :-
	member(Col,Rows),
	n_valid_board(Cols,Rows).
n_valid_board(Cols,Rows) :-
	fd_all_different(Cols),
	i_n_valid_board(Cols,Rows).


	/*
n_queens(Queens) :-
	n_rows(Queens,Rows),
	n_tuples(Rows,Queens,Tuples),
	n_valid_board(Queens,Rows).
	*/
