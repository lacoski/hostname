class hostname::set_hostname
(
    $hostname = $hostname::params::hostname,
  )
  inherits hostname::params
{
  notify{"set host name to ${hostname}":}
  file { '/etc/hostname':
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => '0644',
    content => "${hostname}",
    notify  => Exec['set-hostname'],
  }

  exec { 'set-hostname':
    command => '/bin/hostname -F /etc/hostname',
    unless  => '/usr/bin/test `hostname` = `/bin/cat /etc/hostname`',
  }

}
