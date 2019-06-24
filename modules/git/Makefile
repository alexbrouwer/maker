
## Push all git tags
git/tags/push:
	@git push --tags

## Create git tag GIT_TAG=...
git/tag:
	$(call assert-set,GIT_TAG)
	git tag $(GIT_TAG)