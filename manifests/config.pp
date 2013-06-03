# Class: nrpe_basic::config
#
#   Manage the configuration skeleton for NRPE
#
class nrpe_basic::config {
  nrpe_basic::command { 'check_puppet_run':
    ensure     => 'present',
    command    => 'check_file_age',
    parameters => '-f /var/lib/puppet/state/state.yaml -w 5400 -c 7200',
  }
}
