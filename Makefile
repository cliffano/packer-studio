ci: clean tools deps lint docker-studio

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

aws-studio:
	mkdir -p logs/
	PACKER_LOG_PATH=logs/packer-aws-studio.log \
		PACKER_LOG=1 \
		packer build \
		templates/aws-studio.json

docker-studio:
	mkdir -p logs/
	PACKER_LOG_PATH=logs/packer-docker-studio.log \
		PACKER_LOG=1 \
		packer build \
		templates/docker-studio.json

publish-docker-studio:
	docker push cliffano/studio:latest

tools:
	gem install puppet-lint r10k

.PHONY: ci clean deps lint docker-studio publish-docker-studio tools
