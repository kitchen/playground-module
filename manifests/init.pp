# == Class: playground
#
# Full description of class playground here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class playground (
  $package_name = $playground::params::package_name,
  $service_name = $playground::params::service_name,
) inherits playground::params {

  # validate parameters here

  class { 'playground::install': } ->
  class { 'playground::config': } ~>
  class { 'playground::service': } ->
  Class['playground']
}
