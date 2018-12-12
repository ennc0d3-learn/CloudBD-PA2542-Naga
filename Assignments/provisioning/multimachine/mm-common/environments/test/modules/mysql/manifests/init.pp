class mysql {
  exec { 'apt-get-update':
    command => '/usr/bin/apt-get -y update',
    }
  exec { 'debconf':
     command => "/bin/echo 'mysql-server mysql-server/root_password password rootroot\nmysql-server mysql-server/root_password_again password rootroot' | sudo -E /usr/bin/debconf-set-selections",
     require => Exec['apt-get-update'],
  }
  package { ['mysql-server']:
      ensure => installed,
      require => Exec['debconf'],
  }
}

