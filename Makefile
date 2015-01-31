CC=gcc
CFLAGS=-fPIC -shared -I.
ERL_HOME=/usr/local/lib/erlang
EINC=-I$(ERL_HOME)/usr/include
SRC=c_src
ODIR=obj
PRIV=priv
EBIN=ebin
LIB=lib

DEPS=$(SRC)/crc.h

_OBJ = crc.o crc16.o 
OBJ = $(patsubst %,$(ODIR)/%,$(_OBJ))

$(ODIR)/%.o: $(SRC)/%.c $(DEPS)
	@mkdir -p $(@D)
	$(CC) -fPIC -c -o $@ $< $(EINC)

$(LIB)/crc16.so: $(OBJ)
	@mkdir -p $(@D)
	gcc -o $@ $^ $(CFLAGS)

.PHONY: clean

clean:
	rm -f $(ODIR)/*.o $(SRC)/*~ core
