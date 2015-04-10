# == Class playground::install
#
class playground::install {

  package { $playground::package_name:
    ensure => present,
  }
}
