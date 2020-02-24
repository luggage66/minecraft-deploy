NS_NAME ?= minecraft
RELEASE_NAME ?= minecraft
HELM_BIN ?= helm3
MINECRAFT_HELM_CHART ?= stable/minecraft

help: ## print this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort \
		| sed 's/^.*\/\(.*\)/\1/' \
		| awk 'BEGIN {FS = ":[^:]*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

deploy: ## Deploy jupyterhub to kubernetes
	$(HELM_BIN) upgrade --install $(RELEASE_NAME) $(MINECRAFT_HELM_CHART) \
		--namespace $(NS_NAME) \
		--set minecraftServer.eula=true,minecraftServer.Difficulty=hard \
		--post-renderer ./kustomize-helm.sh \
		-f values.yaml \
		-f secret-values.yaml

template: ## Deploy minecraft to kubernetes
	$(HELM_BIN) upgrade --install $(RELEASE_NAME) $(MINECRAFT_HELM_CHART) \
		--namespace $(NS_NAME) \
		--set minecraftServer.eula=true,minecraftServer.Difficulty=hard \
		--post-renderer ./kustomize-helm.sh \
		--debug --dry-run \
		-f values.yaml \
		-f secret-values.yaml

undeploy: ## undeploy minecraft
	$(HELM_BIN) delete $(RELEASE_NAME)
