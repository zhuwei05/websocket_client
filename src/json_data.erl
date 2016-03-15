-module(json_data).
-export([login_data/0]).
-compile([debug_info, export_all]).

login_data() ->
    {[
    {<<"event">>,<<"login">>},
    {<<"data">>,{[
    {<<"profile">>, {[{<<"user_id">>,<<"1000">>},
                    {<<"tenant_id">>,<<"1000">>},
                    {<<"workgroup_id">>,<<"1000">>},
                    {<<"department_id">>,<<"1000">>},
                    {<<"employee_id">>,<<"1000">>},
                    {<<"employee_name">>,<<"1000">>}]}},
    {<<"status">>, <<"busy">>},
    {<<"role">>, <<"agent">>},
    {<<"sip_username">>, <<"1000">>},
    {<<"sip_realm">>, <<"sip.zw-kazoo01.wj.sankuai.info">>},
    {<<"skills">>, [{[{<<"b9a96b4207030bea8f173a6e6d43ca56">>, 50}, {<<"b9a96b4207030bea8f173a6e6d43ca56">>, 50}]}]},
    {<<"supervisees">>, [<<"1000">>, <<"1001">>]},
    {<<"request_id">>,<<"1">>}
    ]}}
    ]}.

set_status_data(Status) ->
    {[
        {<<"event">>, Status},
        {<<"data">>,{[
            {<<"reason">>, <<"meeting">>},
            {<<"request_id">>,<<"2">>}
        ]}}
    ]}.


logout_data() ->
    {[
        {<<"event">>, <<"logout">>},
        {<<"data">>,{[
            {<<"request_id">>,<<"3">>}
        ]}}
    ]}.

outbound(CalleeNumber) ->
    {[
        {<<"event">>, <<"outbound">>},
        {<<"data">>,{[
            {<<"request_id">>,<<"4">>},
            {<<"callee_number">>, CalleeNumber}
        ]}}
    ]}.

hold() ->
    {[
        {<<"event">>, <<"hold">>},
        {<<"data">>,{[
            {<<"request_id">>,<<"5">>}
        ]}}
    ]}.

resume() ->
    {[
        {<<"event">>, <<"resume">>},
        {<<"data">>,{[
            {<<"request_id">>,<<"6">>}
        ]}}
    ]}.

transfer(Target) ->
    {[
        {<<"event">>, <<"resume">>},
        {<<"data">>,{[
            {<<"request_id">>,<<"7">>},
            {<<"target">>, Target}
        ]}}
    ]}.

bulk_set_status(Status) ->
    {[
        {<<"event">>, Status},
        {<<"data">>,{[
            {<<"request_id">>,<<"8">>},
            {<<"supervisees">>, [<<"1000">>]}
        ]}}
    ]}.

listen(Mode) ->
    {[
        {<<"event">>, Mode},
        {<<"data">>,{[
            {<<"request_id">>,<<"9">>}
        ]}}
    ]}.

break() ->
    {[
        {<<"event">>, <<"break">>},
        {<<"data">>,{[
            {<<"request_id">>,<<"10">>}
        ]}}
    ]}.

ping() ->
    {[
        {<<"event">>, <<"ping">>},
        {<<"data">>,{[
            {<<"request_id">>,<<"11">>}
        ]}}
    ]}.
