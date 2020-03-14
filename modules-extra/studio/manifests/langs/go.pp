class studio::langs::go (
) {

  class { 'golang':
    repo_version => 'go1.14'
  }

  class { 'hashicorp':
    install_dir        => '/usr/local/bin/',
    download_cache_dir => '/tmp/hashicorp-cache/',
  }

  class { 'hashicorp::terraform':
    version => '0.12.21',
  }
}
