# Class: nrpe_basic::params
#
#   Parameters for the NRPE module.
#
class nrpe_basic::params {
  $libdir_param = $::architecture ? {
    'x86_64' => 'lib64',
    default  => 'lib',
  }

  case $::osfamily {
    RedHat: {
      $package_name = 'nrpe'
      $nrpe_dir     = '/etc/nrpe.d'
      $service_name = 'nrpe'
    }
    Debian: {
      $package_name = 'nagios-nrpe-server'
      $nrpe_dir     = '/etc/nagios/nrpe.d'
      $service_name = 'nagios-nrpe-server'
    }
    default: {
      fail("Module ${module_name} is not supported on ${::osfamily}")
    }
  }

  # find out the default nagios paths for plugis
  $defaultdir = $::architecture ? {
    'x86_64' => '/usr/lib64/nagios/plugins',
    default  => '/usr/lib/nagios/plugins',
  }

}
