-module(hello_handler).
-behavior(cowboy_handler).

-export([init/2]).

%% Handle incoming HTTP requests
init(Req0, State) ->
    Req = cowboy_req:reply(200,
        #{<<"content-type">> => <<"text/plain">>},
        <<"Hello, Erlang World!">>,
        Req0),
    {ok, Req, State}.
