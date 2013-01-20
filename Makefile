CFLAGS?=-Wall -Os
LDADD?=`pkg-config --cflags --libs x11 xinerama xft`
PREFIX?=$(DESTDIR)/usr
BINDIR?=$(PREFIX)/bin

all: normal

normal:
	$(CC)  -o simpleswitcher simpleswitcher.c $(CFLAGS) $(LDADD) $(LDFLAGS)

debug:
	$(CC) -o simpleswitcher-debug simpleswitcher.c $(CFLAGS) -Wunused-parameter -g -DDEBUG $(LDADD) 

install:
	install -Dm 755 simpleswitcher $(BINDIR)/simpleswitcher

clean:
	rm -f simpleswitcher simpleswitcher-debug
