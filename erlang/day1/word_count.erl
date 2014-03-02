-module(word_count).
-export([count_string/1]).

count_string(Str) -> internal_count(Str, start).

internal_count([],_) -> 0;
internal_count([Char|Str],start) when Char==32 -> internal_count(Str,start);
internal_count([Char|Str],start) when Char/=32 -> 1 + internal_count(Str,word);
internal_count([Char|Str],word) when Char==32 -> internal_count(Str,start);
internal_count([Char|Str],word) when Char/=32 -> internal_count(Str, word).
