-module(test1).
-export([hello/0,
        hello/1,
        factorial/1,
        sum/1,
        sum_tail/2,
        sum_tail_call/1,
        sumList/1,
        count/1,
        average/1,
        command/1,
        double_list/1,
        map/2,
        process_loop/0,
        list_process/1]).

list_process(List) ->
    receive
            {put,Val} ->
                NewList = [Val|List],
                    list_process(NewList);
            print ->
                io:format("~p~n",[List]),
                list_process(List)
    end.

process_loop() ->
    receive
            Message ->
                    io:format("~s ~n",[Message]),
                    process_loop()
    end.


% foldl(_,[]) -> 0;
% foldl(F,[H|T]) -> H + foldl(F,T).

% foldr(F,[X,Y]) -> F(X,Y);
% foldr(F,[H|T]) -> F(H,foldr(F,T)).

map(_,[]) -> [];
map(F,[H|T]) -> [F(H)|map(F,T)].

% double_list([1,2,3]) -> [2,4,6]
double_list([]) -> [];
double_list([H|T]) ->
    [H*2|double_list(T)].

factorial(0) -> 1;
factorial(1) -> 1;
factorial(N) when (N > 1) -> 
    N*factorial(N-1);
factorial(N) ->
    io:format("Error!~n").

sum(1) -> 1;
sum(Num) -> Num + sum(Num-1).

sum_tail([],Acc) -> Acc;
sum_tail([H|T],Acc) ->
    sum_tail(T,(Acc+H)).

sum_tail_call(L) -> sum_tail(L,0).

sumList([]) -> 0;
sumList([H|T]) -> H + sumList(T).


count([]) -> 0;
count([_|T]) -> 1 + count(T).

average(C) -> 
    if
            C =/= [] -> 
            sumList(C)/count(C);
        true ->
            error
    end.

command(Message) ->
    case Message of
        {average,L} -> average(L);
        {sum,L} -> sum(L)
    end.

hello() ->
    io:format("Hello World.~n").

hello(joe) ->
    io:format("Hello Joe~n");

hello(mike) ->
    io:format("Hello mike~n").