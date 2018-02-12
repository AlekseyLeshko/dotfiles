DEFAULT_TARGET: install
.PHONY: install

install:
	sh install.sh

add_permissions:
	chmod u+x install.sh
