# Client configuration file (w/ Puppet)

file{'/etc/ssh/ssh-config':
  ensure  => 'present',
  content => 'Host 63960-web-01
	User ubuntu'
}

file_line {'Turn off passwd auth':
  ensure  => 'present',
  line    => 'PasswordAuthentication no',
  match   => '^PasswordAuthentication',
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
