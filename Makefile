.DEFAULT_GOAL := help
.PHONY: help tests

help: ## Display help
	@echo "\033[33mEnvironment Manager\033[0m"
	@echo "============================================"
	@echo ""
	@echo "This Makefile provides helpful commands to build, test, and manage the project and its environment."
	@echo "Feel free to explore the available targets and adjust them if needed."
	@echo ""
	@echo "\033[33mUsage:\033[0m make [option]"
	@echo ""
	@awk ' \
		BEGIN { \
			printf("\033[32m%-30s\033[0m %s\n", "Target", "Description"); \
			print "------------------------------------------\n"; \
		} \
		/^[#][#][ ]*[a-zA-Z]/ { \
			gsub(/^## /, ""); \
			print "\n\033[33m" $$0 "\033[0m"; \
			print "\033[33m------------------------------------------\033[0m"; \
		} \
		/^([a-zA-Z_-]+:([^=]|$$))/ { \
			command = substr($$1, 1, index($$1, ":") - 1); \
			description = substr($$0, index($$0, "##") + 3); \
			printf("\033[32m%-30s\033[0m %s\n", command, description); \
		} \
	' $(MAKEFILE_LIST)
	@echo ""


# Configuration and variables
# ----------------------------------------------------------------------------
DCN = docker exec -it

## Application
# ----------------------------------------------------------------------------
enter: ## Enter into a container by setting its name (Ex: make enter n=<containerName>)
	@$(DCN) ${n} bash;


## System
# ----------------------------------------------------------------------------
image: ## Buil a single image by settings its name (Ex: make image n=<imageName>)
	@@UID=$(id -u) GID=$(id -g) docker-compose build ${n} && docker-compose up -d && docker container ls
	@tput setaf 2 && echo "** ${n} created successfully, goodbye. **" && tput setaf 7;

build: ## Rebuild containers images in their latest config, then restart containers (Ex: make build)
	@UID=$(id -u) GID=$(id -g) docker-compose up -d --remove-orphans --build
	@docker container ls