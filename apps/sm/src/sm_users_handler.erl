-module(sm_users_handler).
-export([init/2]).

init(Req0, Opts) ->
     Method = cowboy_req:method(Req0),
     Req = response(Method, Req0),
     {ok, Req, Opts}.

response(<<"POST">>, Req0) ->
    {ok, PostVals, Req} = cowboy_req:read_urlencoded_body(Req0),
    Echo = proplists:get_value(<<"echo">>, PostVals),
    echo(Echo, Req);

response(<<"GET">>, Req) ->
    cowboy_req:reply(200, #{
     <<"content-type">> => <<"text/plain; charset=utf-8">>
    }, Echo, Req);

response(_, Req) ->
    send(405, Req).

send(Code, Headers, Body, Req) ->
    cowboy_req:reply(Code, #{
     Headers}, Body, Req).

send(Code, Req) ->
    cowboy_req:reply(405, Req).