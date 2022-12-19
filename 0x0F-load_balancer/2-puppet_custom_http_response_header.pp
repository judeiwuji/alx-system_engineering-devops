# automate the task of creating a custom HTTP header response

exec {'sudo chown -R':
  command => "/usr/bin/sudo /usr/bin/chown -R ${hostname}:${hostname} /etc/nginx/sites-available/"
}

file {'/etc/nginx/sites-available/default':
  ensure => 'file'
}

-> file_line{'X-Served-By':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  line   => '    server_name _;
    add_header X-Served-By $hostname;',
  match  => 'server_name _;'
}
