# == Class: couchpotato::config
class couchpotato::config {
  file { '/lib/systemd/system/couchpotato.service':
    ensure  => present,
    content => template('couchpotato/couchpotato.service.erb'),
    mode    => '0644',
  }
}
