.PHONY: push
push:
	git remote update --prune
	git rebase origin/main
	git push origin HEAD:main

.PHONY: remove_local
remove_local:
	git remote update --prune
	git switch --detach origin/main
	@git for-each-ref --format '%(refname:short)' refs/heads | xargs -r -t git branch -D

.PHONY: template
template: template_wiki

.PHONY: template_wiki
template_wiki: test
	helm lint ./wiki

	helm template wiki ./wiki > test/wiki-default.yaml
	helm template wiki ./wiki --values ./wiki/cd/prod-values.yaml > test/wiki-prod.yaml

test:
	mkdir test