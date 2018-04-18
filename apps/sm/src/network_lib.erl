%%%-------------------------------------------------------------------
%%% @author anshakov
%%% @copyright (C) 2018, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 18. Апр. 2018 11:47
%%%-------------------------------------------------------------------
-module(network_lib).
-author("anshakov").

%% API
-export([send/4,send/3,send/2]).

send(Code, Req) ->
    cowboy_req:reply(Code, Req).

send(Code, Body, Req) ->
    cowboy_req:reply(Code, #{<<"content-type">> => <<"application/json; charset=utf-8">>}, Body, Req).

send(Code, Headers, Body, Req) ->
    cowboy_req:reply(Code, #{
     <<"content-type">> => <<"application/json; charset=utf-8">>} ++ Headers, Body, Req).