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

}
