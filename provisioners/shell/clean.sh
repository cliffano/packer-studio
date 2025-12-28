#!/bin/sh
set -o errexit
set -o nounset

export PATH=$ENV_PATH:$PATH

docker system prune -af
docker volume prune -f
sudo rm -rf /usr/local/lib/android /opt/ghc /usr/share/dotnet /usr/local/share/boost
sudo apt-get clean