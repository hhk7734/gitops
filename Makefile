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