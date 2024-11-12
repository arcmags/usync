null:
	@:

.PHONY: install
install:
	@if [ $$UID -eq 0 ]; then \
		install -Dvm755 usync /usr/local/bin/usync; \
		install -Dvm644 man/usync.1 /usr/local/man/man1/usync.1; \
	else \
		install -Dvm755 usync ~/.local/bin/usync; \
		install -Dvm644 man/usync.1 ~/.local/share/man/man1/usync.1; \
	fi

.PHONY: uninstall
uninstall:
	@if [ $$UID -eq 0 ]; then \
		rm -fv /usr/local/bin/usync; \
		rm -fv /usr/local/man/man1/usync.1; \
	else \
		rm -fv ~/.local/bin/usync; \
		rm -fv ~/.local/share/man/man1/usync.1; \
	fi
