#Puppet for ssh file
file { '/etc/ssh/ssh_config':
  ensure   => 'file',
  path     => '/etc/ssh/ssh_config',
  mode     => '0744',
  owner    => 'root',
  group    => 'root',
  content  => "IdentityFile ~/.ssh/holberton
PasswordAuthentication no
Host *
SendEnv LANG LC_*
HashKnownHosts yes
GSSAPIAuthentication yes
GSSAPIDelegateCredentials no
",
  provider => 'posix',
}
