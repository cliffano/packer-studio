class studio::langs::go (
) {

  include golang

  class { 'hashicorp':
    install_dir        => '/usr/local/bin/',
    download_cache_dir => '/tmp/hashicorp-cache/',
  }

  class { 'hashicorp::terraform':
    version => '0.11.10',
  }
}
