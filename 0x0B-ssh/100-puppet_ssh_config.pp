# Client configuration file (w/ Puppet)
file{'/etc/ssh/ssh-config':
ensure  => 'present',
content => 'Host 63960-web-01
User ubuntu
'
}

exec{'Turn off passwd auth':
  command => '/usr/bin/echo "IdentitiesOnly yes" >> /etc/ssh/ssh-config',
  require => File['/etc/ssh/ssh-config']
}

exec{'Declare identity file':
  command => '/usr/bin/echo "IdentityFile ~/.ssh/school" >> /etc/ssh/ssh-config',
  require => File['/etc/ssh/ssh-config']
}
