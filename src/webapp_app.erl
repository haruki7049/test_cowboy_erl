-module(webapp_app).
-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    %% Define routes
    Dispatch = cowboy_router:compile([
        {'_', [{"/", hello_handler, []}]}
    ]),
    
    %% Start Cowboy clear listener (HTTP)
    {ok, _} = cowboy:start_clear(http,
        [{port, 8080}],
        #{env => #{dispatch => Dispatch}}
    ),
    
    webapp_sup:start_link().

stop(_State) ->
    ok = cowboy:stop_listener(http).
