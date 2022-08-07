#!/bin/sh
set -o errexit

export PATH=/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:/usr/local/go/bin:/usr/local/sbin:/usr/local/bin:$PATH

echo "****************************************"
echo "* Provisioned software info"
echo "****************************************"
echo "PATH: $PATH"
echo "puppet version: $(puppet --version)"
echo "facter version: $(facter --version)"
echo "hiera version: $(hiera --version)"
echo "go version: $(go --version)"
echo "java version: $(java --version)"
echo "node.js version: $(node --version)"
echo "python version: $(python --version)"
echo "ruby version: $(ruby --version)"
echo "rust version: $(rust --version)"