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
# [*manage_user*]
#   Whether Puppet should manage this user
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
  $user_shell  = $couchpotato::params::user_shell,
  $manage_user = $couchpotato::params::manage_user,
  $repo        = $couchpotato::params::repo,
) inherits couchpotato::params {

  validate_bool($manage_user)

  class { 'couchpotato::install': } ->
  class { 'couchpotato::config': } ~>
  class { 'couchpotato::service': } ->
  Class['couchpotato']
}
