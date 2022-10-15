#!/bin/sh
set -o errexit

export PATH=/opt/puppetlabs/puppet/bin:/opt/puppetlabs/bin:/usr/local/go/bin:/root/.cargo/bin/:/usr/local/sbin:/usr/local/bin:$PATH

echo "****************************************"
echo "* Provisioned software info"
echo "****************************************"
echo "PATH: $PATH"
echo "puppet version: $(puppet --version)"
echo "facter version: $(facter --version)"
echo "hiera version: $(hiera --version)"
echo "go version: $(go version)"
echo "terraform version: $(terraform version)"
echo "packer version: $(packer version)"
echo "checkmake version: $(checkmake --version)"
echo "node.js version: $(node --version)"
echo "bob version: $(bob --version)"
echo "nestor version: $(nestor --version)"
echo "repoman version: $(repoman --version)"
echo "rtk version: $(rtk --version)"
echo "python version: $(python --version)"
echo "ansible version: $(ansible --version)"
echo "awscli version: $(aws --version)"
echo "checkov version: $(checkov --version)"
echo "ruby version: $(ruby --version)"
echo "gem version: $(gem --version)"
echo "bundler version: $(bundler --version)"
echo "rspec version: $(rspec --version)"
echo "rustc version: $(rustc --version)"
echo "rustup version: $(rustup --version)"
echo "imagemagick convert version: $(convert --version)"
echo "imagemagick mogrify version: $(mogrify --version)"
echo "gh version: $(gh --version)"
echo "bat version: $(bat --version)"
echo "ripgrep version: $(rg --version)"
echo "bottom version: $(btm --version)"
echo "dust version: $(dust --version)"
echo "exa version: $(exa --version)"