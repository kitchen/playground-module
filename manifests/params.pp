# == Class playground::params
#
# This class is meant to be called from playground
# It sets variables according to platform
#
class playground::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'playground'
      $service_name = 'playground'
    }
    'RedHat', 'Amazon': {
      $package_name = 'playground'
      $service_name = 'playground'
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
