class studio::langs::ruby (
) {

  class { '::ruby':
    version      => 'latest',
    gems_version => 'latest',
  }

  package { 'ruby-dev':
    ensure   => latest,
    provider => apt,
  }

  package { 'bundler':
    ensure   => latest,
    provider => gem;
  }

  package { 'rspec':
    ensure   => latest,
    provider => gem;
  }

}
