DOTPATH    := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
CANDIDATES := $(wildcard .??*) $(wildcard .config/*) $(wildcard bin/*)
EXCLUSIONS := scripts .DS_Store .git .gitmodules .gitignore .config
DOTFILES   := $(filter-out $(EXCLUSIONS), $(CANDIDATES))

.DEFAULT_GOAL := help

list: ## Show dot files in this repo
	@$(foreach val, $(DOTFILES), /bin/ls -dF $(val);)

deploy: ## Create symlink to home directory
	@echo '==> Start to deploy dotfiles to home directory.'
	@echo ''
	@$(foreach val, $(DOTFILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

init: ## Setup environment settings
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/scripts/init.sh

update: ## Fetch changes for this repo
	git fetch
	git merge

install: update deploy init ## Run make update, deploy, init
	@exec $$SHELL

# clean: ## Remove the dot files and this repo
# 	@echo 'Remove dot files in your home directory...'
#	@-$(foreach val, $(DOTFILES), rm -vrf $(HOME)/$(val);)
#	-rm -rf $(DOTPATH)

help: ## Self-documented Makefile
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
		| sort \
		| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
