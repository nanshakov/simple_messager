-module(sm_users_handler).
-export([init/2]).

init(Req0, Opts) ->
     Method = cowboy_req:method(Req0),
     Req = response(Method, Req0),
     {ok, Req, Opts}.

%%response(<<"POST">>, Req0) ->
%%    {ok, PostVals, Req} = cowboy_req:read_urlencoded_body(Req0),
%%    Echo = proplists:get_value(<<"echo">>, PostVals),
%%    network_lib:send(200, #{
%%    <<"content-type">> => <<"text/plain; charset=utf-8">>}, Echo, Req);

response(<<"GET">>, Req) ->
    network_lib:send(200, <<"not impl">>, Req);

response(_, Req) ->
    network_lib:send(405, Req).

