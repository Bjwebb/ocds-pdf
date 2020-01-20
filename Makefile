# See http://clarkgrubb.com/makefile-style-guide#prologue
MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SUFFIXES:

# Update if the OCDS documentation adds or removes languages.
LANGUAGES=en
# Update if the OCDS documentation adds, removes or renames pages.
PAGES={,gpa,ocds}
# 15000 may warn: "Warning: Received createRequest signal on a disposed ResourceObject's NetworkAccessManager. This might
# be an indication of an iframe taking too long to load."
DELAY=20000

$(LANGUAGES:.%=%): %:
	wkhtmltopdf \
		--no-stop-slow-scripts \
		--javascript-delay $(DELAY) \
		--disable-smart-shrinking \
		--print-media-type \
		--header-html header.html \
		toc https://standard.open-contracting.org/profiles/gpa/master/$*/$(PAGES) OCDS-GPA-$*.pdf

# See http://clarkgrubb.com/makefile-style-guide#phony-targets
.PHONY: all
all: $(LANGUAGES)
