version ?= 4.0.0
# Target image architecture (amd64 or arm64), defaults to the host architecture
arch ?= $(shell uname -m | sed -e 's/x86_64/amd64/' -e 's/aarch64/arm64/')

ci: clean stage lint build-docker-studio

clean:
	rm -rf stage/ logs/ /tmp/packer-tmp/

stage:
	mkdir -p stage/ stage/ansible/roles/ stage/ansible/collections/

rmdeps:
	rm -rf .venv/

define python_venv
	. .venv/bin/activate && $(1)
endef

deps:
	python3 -m venv .venv
	$(call python_venv,python3 -m pip install -r requirements.txt)
	packer plugins install github.com/hashicorp/docker 1.1.4
	packer plugins install github.com/hashicorp/ansible 1.1.6

deps-upgrade:
	python3 -m venv .venv
	$(call python_venv,python3 -m pip install -r requirements-dev.txt)
	$(call python_venv,pip-compile --upgrade)

lint:
	$(call python_venv,ansible-lint -v .)
	$(call python_venv,yamllint .)
#   Disable shellcheck for now due to likely resource issue with the shellcheck run
# 	shellcheck provisioners/shell/*.sh

build-docker-studio:
	mkdir -p logs/ /tmp/packer-tmp/
	PACKER_LOG_PATH=logs/packer-docker-studio.log \
		PACKER_LOG=1 \
		PACKER_TMP_DIR=/tmp/packer-tmp/ \
		packer build \
		-var-file=conf/docker-studio.json \
		-var arch=$(arch) \
		templates/packer/docker-studio.pkr.hcl

publish-docker-studio:
	docker image push cliffano/studio:$(version)-$(arch)

# Combine the per-architecture images into multi-arch version and latest tags
publish-docker-studio-manifest:
	docker buildx imagetools create \
		--tag cliffano/studio:$(version) \
		--tag cliffano/studio:latest \
		cliffano/studio:$(version)-amd64 \
		cliffano/studio:$(version)-arm64

.PHONY: ci clean rmdeps deps deps-upgrade lint build-aws-studio build-docker-studio publish-docker-studio publish-docker-studio-manifest
