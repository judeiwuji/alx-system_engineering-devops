# automate the task of creating a custom HTTP header response
file {'/home/jude/alx-system_engineering-devops/0x0F-load_balancer/test':
  ensure => 'present'
}

-> file_line{'X-Served-By':
  ensure => 'present',
  path   => '/home/jude/alx-system_engineering-devops/0x0F-load_balancer/test',
  line   => '    server_name _;
    add_header X-Served-By $hostname;',
  match  => 'server_name _;'
}
