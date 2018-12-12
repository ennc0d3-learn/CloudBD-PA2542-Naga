class nodejs {
exec  { 'apt-update':
        command => '/usr/bin/apt-get update'
      }

package { ['curl']:
    require => Exec['apt-update'],
    ensure => installed,
  }

exec { 'node-setup':
    require => Package['curl'],
    path => "/usr/bin/",
    command => 'curl -sL http://deb.nodesource.com/setup_8.x | sudo -E bash -'
}

package { 'nodejs':
    require => Exec['node-setup'],
    ensure => installed
  }


package  { 'build-essential':
    require => Exec['apt-update'],
    ensure => installed,
}
}
