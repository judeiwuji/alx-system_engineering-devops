# Client configuration file (w/ Puppet)

file{'/etc/ssh/ssh_config':
  ensure  => 'file',
}
-> file_line {'Turn off passwd auth':
  ensure  => 'present',
  line    => 'IdentitiesOnly yes',
  match   => '^IdentitiesOnly',
  path    => '/etc/ssh/ssh_config',
  require => File['/etc/ssh/ssh_config']
}
-> file_line {'Declare identity file':
  ensure  => 'present',
  line    => 'IdentityFile ~/.ssh/school',
  match   => '^IdentityFile',
  path    => '/etc/ssh/ssh_config',
  require => File['/etc/ssh/ssh_config']
}
