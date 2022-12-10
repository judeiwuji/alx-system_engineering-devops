# Client configuration file (w/ Puppet)
file{'/etc/ssh/ssh-config':
ensure  => 'present',
content => 'Host 63960-web-01
  User ubuntu
  IdentityFile ~/.ssh/school
  IdentitiesOnly yes'
}
