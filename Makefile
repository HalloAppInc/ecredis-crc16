CC=gcc
CFLAGS=-fPIC -shared -I.
ERL_HOME=/usr/local/lib/erlang
EINC=-I$(ERL_HOME)/usr/include
CSRC=c_src
ODIR=obj
PRIV=priv
EBIN=ebin
ESRC=src
LIB=lib

DEPS=$(CSRC)/crc.h

_OBJ = crc.o crc16.o 
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(CSRC)/%.c $(DEPS)
	@mkdir -p $(@D)
	$(CC) -fPIC -c -o $@ $< $(EINC)

$(LIB)/crc16.so: $(OBJ)
	@mkdir -p $(@D)
	@mkdir -p $(EBIN)
	$(CC) -o $@ $^ $(CFLAGS)
	erlc -o $(EBIN) $(ESRC)/crc16.erl

.PHONY: clean

clean:
	rm -f $(LIB)/*.so $(ODIR)/*.o $(CSRC)/*~ $(ESRC)/*~ core $(EBIN)/*.beam
