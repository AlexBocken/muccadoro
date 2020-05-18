# bthandler
# See LICENSE file for copyright and license details.

VERSION = 1.1

# paths
PREFIX = ~/.local/bin

SRC = muccadoro
OBJ = $(SRC:.c=.o)

install:
	mkdir -p $(DESTDIR)$(PREFIX)
	cp -f muccadoro pom pomft $(DESTDIR)$(PREFIX)
	chmod 755 $(DESTDIR)$(PREFIX)/muccadoro $(DESTDIR)$(PREFIX)/pom $(DESTDIR)$(PREFIX)/pomft

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/muccadoro $(DESTDIR)$(PREFIX)/pom $(DESTDIR)$(PREFIX)/pomft

.PHONY: install uninstall
