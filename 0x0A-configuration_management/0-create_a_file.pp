#create a file with content

file {'/tmp/holberton':

      path    => '/tmp/holberton',
      mode    => '0744',
      owner   => 'www-data',
      group   => 'www-data',
      content  => 'I love puppet',
      provider => 'posix',

}
