# Client configuration file (w/ Puppet)
exec{'ssh config':
command => '/usr/bin/echo -e "Host 63960-web-01\n\tUser ubuntu\n\tIdentityFile ~/.ssh/school\n\tIdentitiesOnly yes" >> /etc/ssh/ssh-config'
}
