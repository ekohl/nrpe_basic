# Class: nrpe_basic
#
# This module manages nrpe_basic
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
class nrpe_basic {

  class { 'nrpe_basic::packages':
    notify => Class['nrpe_basic::service'],
  }

  class { 'nrpe_basic::config':
    require => Class['nrpe_basic::packages'],
    notify  => Class['nrpe_basic::service'],
  }

  class { 'nrpe_basic::service': }

}
