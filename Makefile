CFLAGS?=-Wall -Os
LDADD?=`pkg-config --cflags --libs x11 xinerama xft xres`
PREFIX?=$(DESTDIR)/usr
BINDIR?=$(PREFIX)/bin
MANDIR?=${PREFIX}/share/man

all: normal

normal:
	$(CC)  -o simpleswitcher simpleswitcher.c $(CFLAGS) $(LDADD) $(LDFLAGS)

debug:
	$(CC) -o simpleswitcher-debug simpleswitcher.c $(CFLAGS) -Wunused-parameter -g -DDEBUG $(LDADD) 

install:
	install -Dm 755 simpleswitcher $(BINDIR)/simpleswitcher
	install -Dm 644 -t $(MANDIR)/man1 simpleswitcher.1

clean:
	rm -f simpleswitcher simpleswitcher-debug
