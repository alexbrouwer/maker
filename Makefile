export MAKER_PATH ?= $(shell 'pwd')
export OS ?= $(shell uname -s | tr '[:upper:]' '[:lower:]')
export SELF ?= $(MAKE)

# Debug should not be defaulted to a value because some cli consider any value as `true` (e.g. helm)
export DEBUG ?=

ifeq ($(CURDIR),$(realpath $(MAKER_PATH)))
# List of targets the `readme` target should call before generating the readme
export DEFAULT_HELP_TARGET = help/all
endif

# Import Makefiles into current context
include $(MAKER_PATH)/Makefile.*
include $(MAKER_PATH)/modules/*/bootstrap.Makefile*
include $(MAKER_PATH)/modules/*/Makefile*

ifndef TRANSLATE_COLON_NOTATION
%:
	@$(SELF) -s $(subst :,/,$@) TRANSLATE_COLON_NOTATION=false
endif