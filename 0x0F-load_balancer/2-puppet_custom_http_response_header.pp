# automate the task of creating a custom HTTP header response

exec {'sudo chown -R':
  command => "/usr/bin/sudo /bin/chown -R ${id}:${id} /etc/nginx/sites-available/"
}

exec {'sudo service nginx':
  command => '/usr/bin/sudo /usr/sbin/service nginx restart'
}

file {'/etc/nginx/sites-available/default':
  ensure => 'file'
}

-> file_line{'X-Served-By':
  ensure  => 'present',
  path    => '/etc/nginx/sites-available/default',
  line    => '    server_name _;
    add_header X-Served-By $hostname;',
  match   => 'server_name _;',
  require => Exec['sudo service nginx']
}
