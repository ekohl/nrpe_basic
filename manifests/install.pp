# Class: nrpe_basic::install
#
#   Install packages for NRPE
#
class nrpe_basic::install {
  package {$nrpe_basic::params::package_name:
    ensure => installed,
  }
}
