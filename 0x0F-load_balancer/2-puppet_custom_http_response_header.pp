# automate the task of creating a custom HTTP header response
file {'/etc/nginx/sites-available/default':
  ensure => 'present'
}

-> file_line{'X-Served-By':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  line   => '    server_name _;
    add_header X-Served-By $hostname;',
  match  => 'server_name _;'
}
