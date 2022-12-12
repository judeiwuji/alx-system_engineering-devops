# Client configuration file (w/ Puppet)

file{'/etc/ssh/ssh_config':
  ensure  => 'file',
  content => 'IdentitiesOnly yes
IdentityFile ~/.ssh/school'
}
