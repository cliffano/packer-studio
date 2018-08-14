class studio::langs::java (
  $java_version  = '8u141',
  $maven_version = '3.5.0',
) {

  class { 'oracle_java':
    version => $java_version,
    type    => 'jdk',
  }

  class { 'maven::maven':
    version => $maven_version,
  }

  package { 'unzip':
    ensure   => latest,
    provider => apt,
  }

  package { 'zip':
    ensure   => latest,
    provider => apt,
  }

  package { 'curl':
    ensure   => latest,
    provider => apt,
  }

  include sdkman

}
