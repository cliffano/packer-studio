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

  # Needed by psych gem
  package { 'libyaml-dev':
    ensure   => latest,
    provider => apt,
  }

  package { 'bundler':
    ensure   => '2.4.22',
    provider => gem;
  }

  package { 'rspec':
    ensure   => latest,
    provider => gem;
  }

}
