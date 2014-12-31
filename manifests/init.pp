# == Class: couchpotato
#
# Install CouchPotato
#
# === Parameters
#
# [*install_dir*]
#   Where CouchPotato should be installed
#
# [*data_dir*]
#   The directory containing data created by CouchPotato
#
# [*user*]
#   The user CouchPotato should run as
#
# [*user_shell*]
#   The CouchPotato user's shell
#
# [*address*]
#   The address CouchPotato should listening on
#
# [*port*]
#   The port number CouchPotato should be running on
#
# [*pidfile*]
#   The pidfile for the CouchPotato process
#
# [*repo*]
#   The upstream git repo from which CouchPotato will be installed
#
# === Examples
#
#  class { 'couchpotato':
#    user => 'jim',
#  }
#
#  # use a custom repo
#  class { 'couchpotato':
#    repo => 'https://github.com/someone/couchpotato-forked',
#  }
#
class couchpotato (
  $install_dir = $couchpotato::params::install_dir,
  $data_dir    = $couchpotato::params::data_dir,
  $user        = $couchpotato::params::user,
  $address     = $couchpotato::params::address,
  $port        = $couchpotato::params::port,
  $pidfile     = $couchpotato::params::pidfile,
  $repo        = $couchpotato::params::repo,
) inherits couchpotato::params {

  class { 'couchpotato::install': } ->
  class { 'couchpotato::config': } ~>
  class { 'couchpotato::service': } ->
  Class['couchpotato']
}
