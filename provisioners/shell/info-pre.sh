#!/bin/sh
set -o errexit
set -o nounset

export PATH=/home/linuxbrew/.linuxbrew/bin/:/root/.cargo/bin:/root/.local/bin:/root/go/bin:/opt/poetry-venv/bin:/opt/poetry/bin:/usr/local/go/bin:/usr/local/maven/bin:/usr/local/node/bin:/usr/local/openjdk-jdk/bin:$PATH

echo "****************************************"
echo "* Provisioned software info - Pre"
echo "****************************************"
echo "PATH: $PATH"
echo "ansible version: $(ansible --version)"
echo "curl version: $(curl --version)"
echo "docker version: $(docker --version)"
echo "gh version: $(gh --version)"
echo "pip3 version: $(pip3 --version)"
echo "pipx version: $(pipx --version)"
echo "python3 version: $(python3 --version)"
echo "wget version: $(wget --version)"
