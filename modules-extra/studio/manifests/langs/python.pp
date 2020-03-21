class studio::langs::python (
) {

  class { 'python' :
    version    => 'system',
    pip        => 'present',
    dev        => 'present',
    virtualenv => 'present',
    gunicorn   => 'absent',
  }

  python::pip { 'ansible' :
    pkgname => 'ansible',
    ensure  => latest,
   }

}
