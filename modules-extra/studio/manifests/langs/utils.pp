class studio::langs::utils (
) {

  package { ['unzip', 'zip', 'curl', 'vim']:
    ensure   => latest,
    provider => apt,
  }

  include git

  # include 'docker'

  accounts::user { 'studio':
    uid    => '8888',
    gid    => '8888',
    group  => 'staff',
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

}
