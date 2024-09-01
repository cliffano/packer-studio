#!/bin/sh
set -o errexit
set -o nounset

export PATH=/usr/local/go/bin:/usr/local/maven/bin:/usr/local/node-v22.7.0-linux-x64/bin/:/usr/local/openjdk-jdk/bin/:/root/.cargo/bin/:$PATH

echo "****************************************"
echo "* Provisioned software info - Post"
echo "****************************************"
echo "PATH: $PATH"
echo "bob version: $(bob --version)"
echo "gem version: $(gem --version)"
echo "java version: $(java --version)"
echo "jq version: $(jq --version)"
echo "mvn version: $(mvn --version)"
echo "node version: $(node --version)"
echo "npm version: $(npm --version)"
echo "npx version: $(npx --version)"
echo "packer version: $(packer --version)"
echo "ruby version: $(ruby --version)"
echo "rustc version: $(rustc --version)"
echo "rustup version: $(rustup --version)"
echo "shellcheck version: $(shellcheck --version)"
echo "terraform version: $(terraform --version)"
echo "tflint version: $(tflint --version)"
echo "trivy version: $(trivy --version)"
echo "virtualenv version: $(virtualenv --version)"
echo "yq version: $(yq --version)"
echo "zip version: $(zip --version)"