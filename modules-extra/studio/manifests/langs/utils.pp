class studio::langs::utils (
) {

  package { ['zip', 'curl', 'vim', 'shellcheck', 'telnet', 'gpg-agent', 'imagemagick']:
    ensure   => latest,
    provider => apt,
  }

  package { ['dnf']:
    ensure   => latest,
    provider => yum,
  }

  include git

  # include 'docker'

  accounts::user { 'studio':
    uid    => '8888',
    gid    => '8888',
    group  => 'staff',
    home   => '/home/studio',
    shell  => '/bin/bash',
    locked => false,
  }

  file { ['/usr/local/bin/', '/usr/local/lib/']:
    ensure  => directory,
    recurse => true,
    mode    => '0777',
    owner   => 'studio',
    group   => 'staff',
  }

  exec { 'dnf install "dnf-command(config-manager)"':
    path => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  } -> exec { 'dnf config-manager --add-repo https://cli.github.com/packages/rpm/gh-cli.repo':
    path => ['/bin', '/usr/bin', '/sbin', '/usr/sbin'],
  } ->  package { ['gh']:
    ensure   => latest,
    provider => dnf,
  }
}
