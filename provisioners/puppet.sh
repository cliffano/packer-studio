#!/bin/sh

# Install Puppet, adapted from
# https://github.com/puppetlabs/puppet-in-docker/blob/master/puppet-agent-ubuntu/Dockerfile
# Will switch to Puppetlabs' Docker image if they provide puppet-masterless
echo -e 'APT::Periodic::MaxSize "20480000";\nAPT::Periodic::MinAge "2";' |  sudo tee /etc/apt/apt.conf.d/99_periodic_autoclean
apt-get update
apt-get autoremove
apt-get autoclean
apt-get install --no-install-recommends -y wget apt-transport-https ca-certificates lsb-release sudo apt-utils software-properties-common locales
wget https://apt.puppetlabs.com/puppetlabs-release-pc1-xenial.deb
dpkg -i puppetlabs-release-pc1-xenial.deb
rm puppetlabs-release-pc1-xenial.deb
apt-get install --no-install-recommends -y puppet-agent
rm -rf /var/lib/apt/lists/*
add-apt-repository -y ppa:cpick/hub
PATH=/opt/puppetlabs/server/bin:/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:$PATH

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
