-module(counting).
-export([count/2]).

count(Start,End) when Start > End -> io:format("completed counting~n");
count(Start,End) when Start =< End -> io:format("count: ~p~n",[Start]), count(Start+1,End).
