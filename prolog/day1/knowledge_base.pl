book(enders_game, orson_scott_card).
book(speaker, orson_scott_card).
book(effective_java, joshua_bloch).
book(java_concurrency, joshua_bloch).
book(resurrection_redemption, richard_gaffin).
book(perspectives_pentecost, richard_gaffin).

books(X, Y) :- book(X, Y).