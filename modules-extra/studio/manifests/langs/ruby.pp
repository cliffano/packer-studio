class studio::langs::ruby (
) {

  package { 'ruby-dev':
    ensure   => latest,
    provider => apt,
  }

  # Needed by psych gem
  package { 'libyaml-dev':
    ensure   => latest,
    provider => apt,
  }

  class { 'rvm': }

  rvm_system_ruby {
    'ruby-3.3.0':
      ensure      => 'present',
      default_use => true,
      build_opts  => ['--binary'];
    'ruby-2.7.7':
      ensure      => 'present',
      default_use => false;
  }

  rvm_gemset {
    'ruby-3.3.0@studio':
      ensure  => present,
      require => Rvm_system_ruby['ruby-3.3.0'];
  }
  rvm_gem {
    'ruby-3.3.0@studio/bundler':
      ensure  => latest,
      require => Rvm_gemset['ruby-3.3.0@studio'];
  }
  rvm_gem {
    'ruby-3.3.0@studio/rspec':
      ensure  => latest,
      require => Rvm_gemset['ruby-3.3.0@studio'];
  }

  rvm_gemset {
    'ruby-2.7.7@studio':
      ensure  => present,
      require => Rvm_system_ruby['ruby-2.7.7'];
  }
  rvm_gem {
    'ruby-2.7.7@studio/bundler':
      ensure  => '2.4.22',
      require => Rvm_gemset['ruby-2.7.7@studio'];
  }
  rvm_gem {
    'ruby-2.7.7@studio/rspec':
      ensure  => latest,
      require => Rvm_gemset['ruby-2.7.7@studio'];
  }

}