version ?= 1.0.0-pre.0

ci: clean tools deps lint build-docker-studio

clean:
	rm -rf logs modules

deps:
	r10k puppetfile install --moduledir modules

lint:
	puppet-lint \
		--fail-on-warnings \
		--no-documentation-check \
		provisioners/*.pp \
		modules-extra/*/manifests/langs/*.pp
	shellcheck \
		provisioners/*.sh

build-aws-studio:
	mkdir -p logs/
	PACKER_LOG_PATH=logs/packer-aws-studio.log \
		PACKER_LOG=1 \
		packer build \
		templates/aws-studio.json

build-docker-studio:
	mkdir -p logs/ /tmp/packer-tmp/
	PACKER_LOG_PATH=logs/packer-docker-studio.log \
		PACKER_LOG=1 \
		PACKER_TMP_DIR=/tmp/packer-tmp/ \
		packer build \
		-var-file=conf/docker-studio.json \
		templates/docker-studio.json

publish-docker-studio:
	docker push cliffano/studio:latest

release:
	rtk release

publish:
	docker image push cliffano/studio:latest
	docker image push cliffano/studio:$(version)

tools:
	gem install puppet-lint r10k

.PHONY: ci clean deps lint build-aws-studio build-docker-studio publish-docker-studio release tools
