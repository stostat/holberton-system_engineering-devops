#All instalations with puppet
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

service { 'nginx':
  ensure  => running,
  require => Package['nginx'],
}
