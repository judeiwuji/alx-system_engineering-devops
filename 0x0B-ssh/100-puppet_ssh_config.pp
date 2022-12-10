# Client configuration file (w/ Puppet)
exec {'puppet module install':
  command => '/usr/bin/puppet module install puppetlabs-stdlib --version 4.9.1'
}

package {'puppetlabs-stdlib':
  ensure  => 'installed',
  require => Exec['puppet module install']
}

file{'/etc/ssh/ssh-config':
  ensure  => 'present',
  content => 'Host 63960-web-01
	User ubuntu'
}

file_line {'Turn off passwd auth':
  ensure  => 'present',
  line    => 'IdentitiesOnly yes',
  match   => '^IdentitiesOnly',
  path    => '/etc/ssh/ssh-config',
  require => File['/etc/ssh/ssh-config']
}

file_line {'Declare identity file':
  ensure  => 'present',
  line    => 'IdentityFile ~/.ssh/school',
  match   => '^IdentityFile',
  path    => '/etc/ssh/ssh-config',
  require => File['/etc/ssh/ssh-config']
}
