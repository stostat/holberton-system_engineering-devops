#All instalations with puppet
exec {'server-conf':
  command  => 'sudo apt-get update';

}
package { 'nginx':
  ensure => installed,
  name   => 'nginx', # Double check
}

file { '/var/www/html/index.html':
  content => 'Holberton School',
}

file_line { 'sites-default':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'root /var/www/html;',
  # Could use a shell command but this is more clean
  line   => '	rewrite ^/redirect_me https://www.youtube.com/watch?v=QH2-TGUlwu4 permanent;',
}
file_line{ 'custom-http-header':
  ensure => 'present',
  path   => '/etc/nginx/sites-available/default',
  after  => 'listen 80 default server;',
  line   => 'add_header X-Served-By "$HOSTNAME";'
}
service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
