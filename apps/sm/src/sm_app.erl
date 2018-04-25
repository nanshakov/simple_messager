%%%-------------------------------------------------------------------
%% @doc sm public API
%% @end
%%%-------------------------------------------------------------------

-module(sm_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    Dispatch = cowboy_router:compile([
        {'_', [
            {"/", sm_main_handler, []},
            {"/users/", sm_users_handler, []},
            {"/account/", sm_account_handler, []},
            {"/messages/", sm_message_handler, []}
        ]}
    ]),
    {ok, _} = cowboy:start_clear(http, [{port, 8080}], #{
        env => #{dispatch => Dispatch}
    }),
    sm_sup:start_link().

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
