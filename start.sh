#!/bin/bash
rebar compile

erl -pa /Users/zhuwei/mygit/src/erlang/erlang-demo/websocket_client/src/ -pa /Users/zhuwei/mygit/src/erlang/erlang-demo/websocket_client/deps/jiffy/ebin/ -pa /Users/zhuwei/mygit/src/erlang/erlang-demo/websocket_client/ebin/ -name xyz
