#!/bin/sh
set -o errexit

apt-get update
apt-get autoremove
apt-get autoclean

# Install Puppet, adapted from
# https://github.com/puppetlabs/puppet-in-docker/blob/master/puppet-agent-ubuntu/Dockerfile
# Will switch to Puppetlabs' Docker image if they provide puppet-masterless
DEBIAN_FRONTEND="noninteractive" apt-get install --no-install-recommends -y wget apt-transport-https ca-certificates lsb-release sudo apt-utils software-properties-common locales
wget https://apt.puppetlabs.com/puppet6-release-xenial.deb
dpkg -i puppet6-release-xenial.deb
rm puppet6-release-xenial.deb

apt-get update
apt-get install --no-install-recommends -y puppet-agent
rm -rf /var/lib/apt/lists/*
PATH=/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:$PATH

# Set locale to en_US UTF-8
locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8

# Install Docker, adapted from 
# https://docs.docker.com/engine/install/ubuntu/
apt-get update
apt-get remove docker docker.io containerd runc
DEBIAN_FRONTEND="noninteractive"  apt-get install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
DEBIAN_FRONTEND="noninteractive" apt-get install -y docker-ce docker-ce-cli containerd.io

# Install yum, for rare package unavailable from apt
apt-get install -y yum

echo "****************************************"
echo "* Initial provisioned sofware info"
echo "****************************************"
echo "PATH: $PATH"
echo "puppet version: $(puppet --version)"
echo "facter version: $(facter --version)"
echo "hiera version: $(hiera --version)"
facter os
