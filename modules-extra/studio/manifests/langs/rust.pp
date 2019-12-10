class studio::langs::rust (
) {

  exec { 'curl https://sh.rustup.rs -sSf | sh -s -- -y':
    path => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  }

  package { 'build-essential':
    ensure   => latest,
    provider => apt,
  }

}
