#!/bin/sh
set -o errexit

echo "****************************************"
echo "* Provisioned software info"
echo "****************************************"
echo "PATH: $PATH"
echo "puppet version: $(puppet --version)"
echo "facter version: $(facter --version)"
echo "hiera version: $(hiera --version)"
echo "node.js version: $(node --version)"
echo "ruby version: $(ruby --version)"