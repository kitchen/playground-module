# == Class playground::service
#
# This class is meant to be called from playground
# It ensure the service is running
#
class playground::service {

  service { $playground::service_name:
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
  }
}
