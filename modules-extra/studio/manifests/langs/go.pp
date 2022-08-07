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

  exec { 'wget https://github.com/mikefarah/yq/releases/download/v4.25.3/yq_linux_amd64 -O /usr/bin/yq && chmod +x /usr/bin/yq':
    path => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  }

  include '::gitclone'
  package { 'pandoc':
    ensure   => latest,
    provider => apt,
  } -> gitclone::repo { 'checkmake' :
    source      => 'https://github.com/mrtazz/checkmake.git',
    branch      => 'main',
    destination => '/tmp/checkmake',
    owner       => 'root',
    group       => 'root',
  } -> exec { '/usr/bin/make':
    path        => ['/usr/local/go/bin', '/bin', '/usr/bin', '/sbin', '/usr/sbin'],
    environment => ['BUILDER_NAME=pakkunbot', 'BUILDER_EMAIL=blah+pakkun@cliffano.com', 'GOPATH=/root/go', 'GOOS=linux', 'GOARCH=amd64'],
    cwd         => '/tmp/checkmake',
  } -> exec { 'cp checkmake /usr/bin/':
    path => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
    cwd  => '/tmp/checkmake',
  }
}
