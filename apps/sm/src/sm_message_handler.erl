%% Feel free to use, reuse and abuse the code in this file.

%% @doc Hello world handler.
-module(sm_message_handler).
-export([init/2]).

init(Req0, Opts) ->
     Method = cowboy_req:method(Req0),
     HasBody = cowboy_req:has_body(Req0),
     Req = maybe_echo(Method, HasBody, Req0),
     {ok, Req, Opts}.

maybe_echo(<<"POST">>, true, Req0) ->
    {ok, PostVals, Req} = cowboy_req:read_urlencoded_body(Req0),
    Echo = proplists:get_value(<<"echo">>, PostVals),
    echo(Echo, Req)/

echo(<<"GET">>, Echo, Req) ->
 cowboy_req:reply(200, #{
  <<"content-type">> => <<"text/plain; charset=utf-8">>
 }, Echo, Req).