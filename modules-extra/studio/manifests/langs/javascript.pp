class studio::langs::javascript (
) {

  class { 'nodejs':
    repo_url_suffix => '13.x',
  }

}
