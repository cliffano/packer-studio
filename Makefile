version ?= 1.5.1-pre.0

ci: clean deps lint build-docker-studio

clean:
	rm -rf logs modules

deps:
	gem install bundler
	bundle install --binstubs -j4
	bundle exec r10k puppetfile install --moduledir modules

lint:
	bundle exec puppet-lint \
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
	docker image push cliffano/studio:latest
	docker image push cliffano/studio:$(version)

release:
	rtk release

.PHONY: ci clean deps lint build-aws-studio build-docker-studio publish-docker-studio release
