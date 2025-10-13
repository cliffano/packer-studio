version ?= 2.14.1-pre.0

ci: clean stage deps lint build-docker-studio

clean:
	rm -rf stage/ logs/ /tmp/packer-tmp/

stage:
	mkdir -p stage/ stage/ansible/roles/ stage/ansible/collections/

deps:
	packer plugins install github.com/hashicorp/docker 1.0.10
	packer plugins install github.com/hashicorp/ansible 1.1.1

lint:
	echo "TODO: Ansible Lint"
	# bundle exec puppet-lint \
	# 	--fail-on-warnings \
	# 	--no-documentation-check \
	# 	provisioners/*.pp \
	# 	modules-extra/*/manifests/langs/*.pp
	# shellcheck \
		# provisioners/shell/*.sh

build-docker-studio:
	mkdir -p logs/ /tmp/packer-tmp/
	PACKER_LOG_PATH=logs/packer-docker-studio.log \
		PACKER_LOG=1 \
		PACKER_TMP_DIR=/tmp/packer-tmp/ \
		packer build \
		-var-file=conf/docker-studio.json \
		templates/packer/docker-studio.pkr.hcl

publish-docker-studio:
	docker image push cliffano/studio:latest
	docker image push cliffano/studio:$(version)

release:
	rtk release

.PHONY: ci clean deps lint build-aws-studio build-docker-studio publish-docker-studio release
