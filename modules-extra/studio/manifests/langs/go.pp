class studio::langs::go (
) {

  class { 'golang':
    repo_version => 'go1.16'
  }

  class { 'hashicorp_install':
    packages => {
      'packer'    => '1.7.2',
      'terraform' => '0.15.5',
    }
  }

}
