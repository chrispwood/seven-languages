-module(error).
-export([err/2]).

err(error, Message) -> io:format("Error: ~p~n",[Message]);
err(success, _) -> io:format("success").
