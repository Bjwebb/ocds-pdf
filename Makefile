# See http://clarkgrubb.com/makefile-style-guide#prologue
MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.SHELLFLAGS := -eu -o pipefail -c
.DEFAULT_GOAL := all
.DELETE_ON_ERROR:
.SUFFIXES:

# Update if the OCDS documentation adds or removes languages.
LANGUAGES=en es fr
# Update if the OCDS documentation adds, removes or renames pages.
PAGES={,getting_started/{,use_cases/,contracting_process/,building_blocks/,releases_and_records/,publication_patterns/,validation/},schema/{,reference/,release/,release_package/,records_reference/,record_package/,merging/,identifiers/,codelists/,conformance_and_extensions/,deprecation/,changelog/},implementation/{,levels/,licensing/,publication_policy/,serialization/,hosting/,registration/,related_processes/,amendments/},extensions/,support/{,tools/,history_and_development,governance/,credits/}}
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
		toc https://standard.open-contracting.org/latest/$*/$(PAGES) OCDS-$*.pdf

# See http://clarkgrubb.com/makefile-style-guide#phony-targets
.PHONY: all
all: $(LANGUAGES)
