An Erlang NIF for generating CRC-16 (polynomial 0x1021).
Its used for the sharding of [redis cluster](https://redis.io/topics/cluster-spec)

This code is forked and modified from https://github.com/building39/crc16_nif

This NIF requires the very fine CRC code (in C) written by Michael Barr.
See http://www.barrgroup.com/Embedded-Systems/How-To/CRC-Calculation-C-Code
for more information. The code can be downloaded from [here](http://www.netrino.com/code/crc.zip).


Note: You can change the CRC standard used by changing the macro near the 
top of the crc.h file - this NIF wants CRC16 (polynomial 0x8005), and the
crc.h file included here has been changed accordingly. The original code
uses the CRC_CCITT standard.


To build, simply run make.


