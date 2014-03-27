# Define: nrpe_basic::command
#
#   Manage a command in /etc/nrpe.d
#
#   Copied from mcollective-plugins github project.
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#
define nrpe_basic::command(
  $command    = $title,
  $parameters = '',
  $cplugdir   = 'auto',
  $ensure     = 'present'
) {

  include nrpe_basic::params

  # if we overrode cplugdir then use that, else go with the nagios default
  # for this architecture
  case $cplugdir {
    'auto':  { $plugdir = $nrpe_basic::params::defaultdir }
    default: { $plugdir = $cplugdir }
  }

  case $ensure {
    'absent':    {
      file{"${nrpe_basic::params::nrpe_dir}/${name}.cfg":
        ensure => absent,
        notify => Class['nrpe_basic::service'],
      }
    }
    default: {
      file {"${nrpe_basic::params::nrpe_dir}/${name}.cfg":
        owner   => '0',
        group   => '0',
        mode    => '0644',
        content => template("${module_name}/nrpe-config.erb"),
        require => Class['nrpe_basic::install'],
        notify  => Class['nrpe_basic::service'],
      }
    }
  }
}
# EOF
