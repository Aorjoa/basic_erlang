-module(chat).
-compile([export_all]).

person(Name) ->
    receive
        {send,To,Msg} -> 
            To ! {Name,Msg};
        {From,Msg} ->
            io:format("From : ~s~n  Message : ~s~n",[From,Msg])
    end,
    person(Name).

 % PP = spwan(chat,person,["Test1"])
 % SS = spwan(chat,person,["Test2"])
 % PP ! {send,SS,"Hello"}