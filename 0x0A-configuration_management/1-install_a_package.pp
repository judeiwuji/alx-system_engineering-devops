# Using Puppet, install flask from pip3.
exec {'pip install flask':
command => '/usr/bin/pip install flask==2.1.0'
}

package{'flask':
ensure  => 'installed',
require => Exec['pip install flask']
}
