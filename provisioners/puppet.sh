#!/bin/sh

# Install Puppet, adapted from
# https://github.com/puppetlabs/puppet-in-docker/blob/master/puppet-agent-ubuntu/Dockerfile
# Will switch to Puppetlabs' Docker image if they provide puppet-masterless
apt-get update
apt-get autoremove
apt-get autoclean

DEBIAN_FRONTEND="noninteractive" apt-get install --no-install-recommends -y wget curl apt-transport-https ca-certificates lsb-release sudo apt-utils software-properties-common locales
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

echo "****************************************"
echo "* Host info"
echo "****************************************"
echo "PATH: $PATH"
echo "puppet version: $(puppet --version)"
echo "facter version: $(facter --version)"
echo "hiera version: $(hiera --version)"
facter os
