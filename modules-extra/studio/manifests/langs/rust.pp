class studio::langs::rust (
) {

  exec { 'curl https://sh.rustup.rs -sSf | sh -s -- -y':
    path => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  }

  package { 'build-essential':
    ensure   => latest,
    provider => apt,
  }

  # https://betterprogramming.pub/5-cli-tools-made-with-rust-to-improve-already-popular-tools-506af07b6d54
  exec { 'cargo install bat ripgrep du-dust bottom exa':
    path => ['/root/.cargo/bin/'],
  }

}
