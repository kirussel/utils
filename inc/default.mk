-include ../inc/debug.mk

ifndef MKDIR
MKDIR=mkdir
endif

ifndef INSTALL
INSTALL=install
endif

ifndef BUNDLE_EXEC
BUNDLE_EXEC=bundle exec
endif

.PHONY: all clean deb default

default: all

build/sbin/% : %.sh
	$(MKDIR) -p $(@D)
	$(INSTALL) -m 0555 $(<) $(@)

pkg/%.deb:
	$(MKDIR) -p $(@D)
	$(BUNDLE_EXEC) fpm \
		-t deb \
		-s dir \
		--name="$(NAME)" \
		--version="$(VERSION)" \
		--package="$(@)" \
		--license=MIT \
		--category=admin \
		--no-depends \
		--no-auto-depends \
		--architecture=amd64 \
		--maintainer="Tools <tools@ba23.org>" \
		--description=$(DESCRIPTION) \
		--url="https://github.com/kirussel/utils" \
		./build/sbin/=/usr/local/sbin/

clean:
	$(RM) -r build pkg
