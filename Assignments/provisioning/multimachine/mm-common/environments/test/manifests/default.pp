node /appserver.*/ {
  include nodejs
  package { ['avahi-daemon', 'libnss-mdns', 'redis-tools']:
      ensure => installed,
  }
}
node /dbserver.*/ {
  include mysql
  package { ['avahi-daemon', 'libnss-mdns', 'redis-tools']:
      ensure => installed,
  }

}

node /webserver.*/ {
  exec { 'apt-get-update':
    command => '/usr/bin/apt-get -y update',
    }

    package { ['nginx', 'avahi-daemon', 'libnss-mdns', 'redis-tools']:
      ensure => installed,
      require => Exec['apt-get-update'],
    }
}

node default {
  exec { 'apt-get-update': command => '/usr/bin/apt-get -y update'}
  package { ['curl', 'avahi-daemon', 'libnss-mdns', 'redis-tools']:
      ensure => installed,
      require => Exec['apt-get-update']
  }
}
