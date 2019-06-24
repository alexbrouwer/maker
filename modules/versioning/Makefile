RELEASE_TYPE ?= patch
CURRENT_VERSION := $(GIT_TAG)

ifndef CURRENT_VERSION
  CURRENT_VERSION := 0.0.0
endif

## Show current version
version/current:
	@echo $(CURRENT_VERSION)

version/next:
	$(call assert-set,VERSION_TYPE)
	@echo $(shell docker run --rm alpine/semver semver -c -i $(VERSION_TYPE) $(CURRENT_VERSION))

## Show next patch version
version/next/patch:
	@$(MAKE) -s version/next VERSION_TYPE=patch

## Show next minor version
version/next/minor:
	@$(MAKE) -s version/next VERSION_TYPE=minor

## Show next major version
version/next/major:
	@$(MAKE) -s version/next VERSION_TYPE=major

