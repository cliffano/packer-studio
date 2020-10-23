exec { ['apt-get update', 'apt-get autoremove', 'apt-get autoclean']:
  path => [
    '/usr/local/sbin',
    '/usr/local/bin',
    '/usr/sbin',
    '/usr/bin',
    '/sbin',
    '/bin',
  ],
}

include studio::langs::utils
include studio::langs::go
include studio::langs::java
include studio::langs::javascript
include studio::langs::python
include studio::langs::ruby
include studio::langs::rust
