-module(crc16).

-export([init/0, crc16/1]).
-on_load(init/0).

init() ->
    erlang:load_nif("./crc16", 0).

crc16(_Str) ->
    "NIF library not loaded".

