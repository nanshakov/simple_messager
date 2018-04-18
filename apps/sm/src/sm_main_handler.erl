-module(sm_main_handler).

-export([init/2]).

init(Req0, Opts) ->
    Method = cowboy_req:method(Req0),
    %#{echo := Echo} = cowboy_req:match_qs([{echo, [], undefined}], Req0),
    Req = response(Method, Req0),
    {ok, Req, Opts}.

response(<<"GET">>, Req0) ->
    network_lib:send(200, #{}, <<"Statistic...">>, Req0).