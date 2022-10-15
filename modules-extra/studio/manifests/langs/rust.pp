class studio::langs::rust (
) {

  exec { 'curl https://sh.rustup.rs -sSf | sh -s -- -y':
    path => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  }

  # https://betterprogramming.pub/5-cli-tools-made-with-rust-to-improve-already-popular-tools-506af07b6d54
  exec { 'cargo install bat':
    path => ['/root/.cargo/bin/', '/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  }
  exec { 'cargo install ripgrep':
    path => ['/root/.cargo/bin/', '/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  }
  exec { 'cargo install du-dust':
    path => ['/root/.cargo/bin/', '/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  }
  exec { 'cargo install bottom':
    path => ['/root/.cargo/bin/', '/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  }
  exec { 'cargo install exa':
    path => ['/root/.cargo/bin/', '/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  }

}
