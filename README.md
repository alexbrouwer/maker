PHP Addition Repository Maker
=============================

This repository contains a structure to easily setup a Makefile

Installation
------------

1. Install the library via composer by running:

```bash
composer require --dev par/maker
```

2. Add the top of your `Makefile` add the following: 
```makefile
export MAKER_PATH ?= vendor/par/maker
-include $(MAKER_PATH)/Makefile
```

3. Add custom targets to your `Makefile`:

```makefile
## Tag current commit as patch release
release/patch:
	@$(MAKE) -s version/next/patch | xargs -I {} -r $(MAKE) -s git/tag GIT_TAG={}
	@$(MAKE) -s git/tags/push

## Tag current commit as minor release
release/minor:
	@$(MAKE) -s version/next/minor | xargs -I {} -r $(MAKE) -s git/tag GIT_TAG={}
	@$(MAKE) -s git/tags/push

## Tag current commit as major release
release/major:
	@$(MAKE) -s version/next/major | xargs -I {} -r $(MAKE) -s git/tag GIT_TAG={}
	@$(MAKE) -s git/tags/push
```

Usage
-----

```bash
Available targets:

  git/tag                             Create git tag GIT_TAG=...
  git/tags/push                       Push all git tags
  help                                Help screen
  help/all                            Display help for all targets
  help/short                          This help short screen
  release/major                       Tag current commit as major release
  release/minor                       Tag current commit as minor release
  release/patch                       Tag current commit as patch release
  version/current                     Show current version
  version/next/major                  Show next major version
  version/next/minor                  Show next minor version
  version/next/patch                  Show next patch version
```