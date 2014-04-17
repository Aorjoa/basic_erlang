-module (tutorial).
-compile([export_all]).

factorial(0) -> 1;
factorial(N) -> N * factorial(N-1).
    