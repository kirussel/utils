include ../inc/default.mk

NAME=aaa-tunes
VERSION=$(shell cat VERSION)
DESCRIPTION="tunes scripts"
DEB=pkg/$(NAME)_$(VERSION)_amd64.deb
EXES=one-day two-day three-day

all: deb
deb: $(DEB)

build/sbin/%: $(EXES:%=%.sh)
$(DEB): $(EXES:%=build/sbin/%)
