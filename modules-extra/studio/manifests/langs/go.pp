class studio::langs::go (
) {

  class { 'golang':
    repo_version => 'go1.17'
  }

  class { 'hashicorp_install':
    packages => {
      'packer'    => '1.7.9',
      'terraform' => '1.1.4',
    }
  }

  exec { 'curl -s https://raw.githubusercontent.com/terraform-linters/tflint/master/install_linux.sh | bash':
    path => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  }

  exec { 'go install github.com/aquasecurity/tfsec/cmd/tfsec@latest':
    path => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  }

}
