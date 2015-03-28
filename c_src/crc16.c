#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "erl_nif.h"

extern int crcFast(unsigned char const message[], int len);
extern int crcInit();

static ERL_NIF_TERM crc16(ErlNifEnv* env,
                          int argc,
                          ERL_NIF_TERM argv[])
{
    unsigned char x[256];
    if (!enif_get_string(env,
                         argv[0],
                         x,
                         sizeof(x) - 1,
                         ERL_NIF_LATIN1)) {
        return enif_make_badarg(env);
    }
    return enif_make_int(env, crcFast(x, strlen(x)));
}
static ErlNifFunc nif_funcs[] =
{
    {"crc16", 1, crc16}
};
ERL_NIF_INIT(crc16, nif_funcs, NULL, NULL, NULL, NULL)

