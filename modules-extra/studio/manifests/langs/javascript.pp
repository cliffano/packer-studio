class studio::langs::javascript (
) {

  class { '::nodejs':
    manage_package_repo       => false,
    nodejs_dev_package_ensure => 'present',
    npm_package_ensure        => 'present',
    repo_url_suffix           => '10.x',
  }

}
