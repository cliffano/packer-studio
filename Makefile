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
	mkdir -p logs/
	PACKER_LOG_PATH=logs/packer-docker-studio.log \
		PACKER_LOG=1 \
		packer build \
		templates/docker-studio.json

publish-docker-studio:
	docker push cliffano/studio:latest

tools:
	gem install puppet-lint r10k

.PHONY: ci clean deps lint build-aws-studio build-docker-studio publish-docker-studio tools
