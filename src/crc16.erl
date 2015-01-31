-module(crc16).

-export([init/0, crc16/1]).
-on_load(init/0).

init() ->
    {ok, Cwd} = file:get_cwd(),
    Niflib = Cwd ++ "/deps/crc16_nif/lib/crc16",
    erlang:load_nif(Niflib, 0).

crc16(_Str) ->
    "NIF library not loaded".

