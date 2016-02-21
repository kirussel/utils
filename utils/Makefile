include ../inc/default.mk

NAME=aaa-utils
VERSION=$(shell cat VERSION)
DESCRIPTION="helper scripts"
DEB=pkg/$(NAME)_$(VERSION)_amd64.deb
EXES=green-day red-day blue-day

all: deb
deb: $(DEB)

build/sbin/%: $(EXES:%=%.sh)
$(DEB): $(EXES:%=build/sbin/%)
