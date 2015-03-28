-module(crc16_tests).
-include_lib("eunit/include/eunit.hrl").

crc16_test() ->
	?assertEqual(16#bb3d, crc16:crc16("123456789")).
