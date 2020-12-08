#Kill process killmenow
exec { 'pkill -f ./killmenow':
  path     => '/usr/bin:/usr/sbin:/bin',
  command  => 'pkill -f ./killmenow',
  provider => 'shell',
}
