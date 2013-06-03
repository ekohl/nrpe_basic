# Class: nrpe_basic::service
#
#   Manage the NRPE service
#
class nrpe_basic::service {

  service { 'nrpe':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    name       => $nrpe_basic::params::service_name,
  }

}
