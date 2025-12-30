#!/bin/sh
set -o errexit
set -o nounset

export PATH=$ENV_PATH:$PATH

docker system prune -af
docker volume prune -f
rm -rf /usr/local/lib/android /opt/ghc /usr/share/dotnet /usr/local/share/boost
apt-get clean
