class studio::langs::python (
) {

  class { 'python' :
    version  => 'system',
    pip      => 'present',
    dev      => 'present',
    gunicorn => 'absent',
  }

  python::pip { 'ansible' :
    ensure  => latest,
    pkgname => 'ansible',
  }

  python::pip { 'awscli' :
    ensure  => latest,
    pkgname => 'awscli',
  }

  python::pip { 'checkov' :
    ensure  => latest,
    pkgname => 'awscli',
  }

}
