# bthandler
# See LICENSE file for copyright and license details.

VERSION = 1.2

# paths
PREFIX = ~/.local/bin

SRC = muccadoro
OBJ = $(SRC:.c=.o)

install:
	mkdir -p $(DESTDIR)$(PREFIX)
	cp -f muccadoro pom pomft $(DESTDIR)$(PREFIX)
	chmod 755 $(DESTDIR)$(PREFIX)/muccadoro
	chmod 755 $(DESTDIR)$(PREFIX)/pom
	chmod 755 $(DESTDIR)$(PREFIX)/pomft

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/muccadoro
	rm -f $(DESTDIR)$(PREFIX)/pom
	rm -f $(DESTDIR)$(PREFIX)/pomft

.PHONY: install uninstall
