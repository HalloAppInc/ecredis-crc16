-module(ecredis_crc16).

-export([init/0, crc16/1]).
-on_load(init/0).

crc16(_Str) ->
     not_loaded(?LINE).

init() ->
    SoName = case code:priv_dir(?MODULE) of
        {error, bad_name} ->
                case filelib:is_dir(filename:join(["..", priv])) of
                    true ->
                        filename:join(["..", priv, ?MODULE]);
                    _ ->
                        filename:join([priv, ?MODULE])
                end;
        Dir ->
            filename:join(Dir, ?MODULE)
    end,
    erlang:load_nif(SoName, 0).

not_loaded(Line) ->
	exit({not_loaded, [{module, ?MODULE}, {line, Line}]}).
