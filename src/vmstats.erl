-module(vmstats).
-behaviour(application).

-export([
    start/0,
    start/2,
    stop/1
]).

start() ->
    ok = application:start(statsderl),
    ok = application:start(vmstats).

start(normal, []) ->
    {ok, PrefixKey} = application:get_env(?MODULE, prefix_key),
    {ok, BaseKey} = application:get_env(?MODULE, base_key),
    vmstats_sup:start_link(PrefixKey ++ BaseKey).

stop(_) ->
    ok.
