-module(crc16_tests).
-include_lib("eunit/include/eunit.hrl").

crc16_test() ->
	?assertEqual(12739, ecredis_crc16:crc16("123456789")).
