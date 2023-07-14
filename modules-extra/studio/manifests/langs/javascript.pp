class studio::langs::javascript (
) {

  class { 'nodejs':
    repo_url_suffix => '20.x',
  }

  package { 'bob':
    ensure   => latest,
    provider => npm,
  }

  package { 'nestor':
    ensure   => latest,
    provider => npm,
  }

  package { 'repoman':
    ensure   => latest,
    provider => npm,
  }

  package { 'rtk':
    ensure   => latest,
    provider => npm,
  }

}
