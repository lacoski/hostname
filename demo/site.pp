node default {
	notify {"Demo đổi tên host và đồng bộ host file !":}
  # Đổi tên host
  class { '::hostname::params':
      hostname => "testbanner.puppet",
  }
  include ::hostname::set_hostname
  # Đồng bộ file /etc/hosts
  file { '/etc/hosts':
    ensure => 'present',
    source => 'puppet:///modules/hostname/hostname.txt',
  }
}
