#### Day 1

- excellent concurrency support (based on multi-processes vice threads)
    + no threading
- simple error model: "let it crash" uses no error recovery along with hot swapping process handling
- based off of prolog
    + for instance, uses pattern matching to get values from hashes (pg 185)
    + basic types: atoms, lists, tuples (tuples are fixed-length lists)k
    + no notion of an object; just atoms
- erlang is dynamically typed (X(Anything) -> Anything.)
- erlang is optimized for tail recursion
- Documentation
    + Official [site](http://www.erlang.org/)
    + StdLib [here](http://erlang.org/doc/apps/stdlib/)
    + OTP [list](http://www.erlang.org/doc/man_index.html)

