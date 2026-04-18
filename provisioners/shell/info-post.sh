#!/bin/sh
set -o errexit
set -o nounset

export PATH=$ENV_PATH:$PATH

echo "****************************************"
echo "* Provisioned software info - Post"
echo "****************************************"
echo "PATH: $PATH"
echo "aws version: $(aws --version)"
echo "bob version: $(bob --version)"
echo "checkmake version: $(checkmake --version)"
echo "gem version: $(gem --version)"
echo "gemini version: $(gemini --version)"
echo "hcledit version: $(hcledit version)"
echo "java version: $(java --version)"
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
echo "zig version: $(zig version)"
