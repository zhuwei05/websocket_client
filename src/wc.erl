-module(wc).

-behaviour(websocket_client_handler).

-export([
         start_link/0,
         init/2,
         websocket_handle/3,
         websocket_info/3,
         websocket_terminate/3
        ]).

-compile([debug_info, export_all]).

% -export([login_test/1, logout_test/1,
%          status_test/1, outbound_test/1]).


login_test(WsPid) ->
    LoginObj = json_data:login_data(),
    websocket_client:cast(WsPid, {text, jiffy:encode(LoginObj)}).

logout_test(WsPid) ->
    LogoutObj = json_data:logout_data(),
    websocket_client:cast(WsPid, {text, jiffy:encode(LogoutObj)}).

status_test(WsPid) ->
    AvailableObj = json_data:set_status_data(<<"available">>),
    AwayObj = json_data:set_status_data(<<"away">>),
    BusyObj = json_data:set_status_data(<<"busy">>),


    websocket_client:cast(WsPid, {text, jiffy:encode(AvailableObj)}),
    websocket_client:cast(WsPid, {text, jiffy:encode(AwayObj)}),
    websocket_client:cast(WsPid, {text, jiffy:encode(BusyObj)}).

outbound_test(WsPid) ->
    OutboundObj = json_data:outbound(<<"4008">>),
    websocket_client:cast(WsPid, {text, jiffy:encode(OutboundObj)}).

hold_test(WsPid) ->
    HoldObj = json_data:hold(),
    websocket_client:cast(WsPid, {text, jiffy:encode(HoldObj)}).

resume_test(WsPid) ->
    Obj = json_data:resume(),
    websocket_client:cast(WsPid, {text, jiffy:encode(Obj)}).

transfer_test(WsPid) ->
    Obj = json_data:transfer(<<"4007">>),
    websocket_client:cast(WsPid, {text, jiffy:encode(Obj)}).


start_link() ->
    crypto:start(),
    ssl:start(),
    {ok, WsPid} = websocket_client:start_link("ws://192.168.181.45:8888/websocket", ?MODULE, []),
    WsPid.
    % websocket_client:start_link("ws://echo.websocket.org", ?MODULE, []).

init([], _ConnState) ->
    % websocket_client:cast(self(), {text, <<"message 1">>}),
    % login_test(),
    {ok, 2}.

websocket_handle({pong, _}, _ConnState, State) ->
    {ok, State};
websocket_handle({text, <<"close">>}, _ConnState, State) ->
    io:format("close ~n"),
    {close, <<>>, State};
websocket_handle({text, Msg}, _ConnState, State) ->
    io:format("Received msg ~p~n", [jiffy:decode(Msg)]),
    case jiffy:decode(Msg) of
        <<"close">> ->
        {close, <<>>, State};
        _ ->
        {ok, State}
    end.

websocket_info(start, _ConnState, State) ->
    {reply, {text, <<"erlang message received">>}, State}.

websocket_terminate(Reason, _ConnState, State) ->
    io:format("Websocket closed in state ~p wih reason ~p~n",
              [State, Reason]),
    ok.
