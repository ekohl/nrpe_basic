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
class nrpe_basic inherits nrpe_basic::params {
  class { 'nrpe_basic::install': } ->
  class { 'nrpe_basic::config': } ~>
  class { 'nrpe_basic::service': } ->
  Class['nrpe_basic']
}
