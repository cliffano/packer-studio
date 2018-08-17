exec { 'apt-get update':
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
