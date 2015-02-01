-module(crc16).

-export([init/0, crc16/1]).
-on_load(init/0).

init() ->
    Path = os:getenv("NIFS_PATH"),
    case Path of
        false -> NifPath = ".";
        _     -> NifPath = Path ++ "/crc16"
    end,
    erlang:load_nif(NifPath, 0).

crc16(_Str) ->
    "NIF library not loaded".

