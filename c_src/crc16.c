#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include "erl_nif.h"

extern int ecrcFast(unsigned char const message[], int len);
extern int ecrcInit();

static ERL_NIF_TERM ecrc16(ErlNifEnv* env,
                          int argc,
                          ERL_NIF_TERM argv[])
{
    // sizeof(x) - 1 represents the length of input that can be processed correctly by the nif.
    unsigned char x[256];
    if (enif_get_string(env,
                        argv[0],
                        x,
                        sizeof(x) - 1,
                        ERL_NIF_LATIN1) <= 0) {
        return enif_make_badarg(env);
    }
    return enif_make_int(env, ecrcFast(x, strlen(x)));
}
static ErlNifFunc nif_funcs[] =
{
    {"crc16", 1, ecrc16}
};
ERL_NIF_INIT(ecredis_crc16, nif_funcs, NULL, NULL, NULL, NULL)

