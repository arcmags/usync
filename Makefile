MANPATH = $(PREFIX)/man
ifeq ($(PREFIX),)
	ifeq ($(USER),root)
		PREFIX = /usr/local
		MANPATH = $(PREFIX)/man
	else
		PREFIX = ~/.local
		MANPATH = $(PREFIX)/share/man
	endif
endif

null:
	@:

.PHONY: install
install:
	env
	install -Dm755 usync $(PREFIX)/bin/usync
	install -Dm644 man/usync.1 $(MANPATH)/man1/usync.1

.PHONY: uninstall
uninstall:
	rm -fv $(PREFIX)/bin/usync
	rm -fv $(MANPATH)/man1/usync.1
