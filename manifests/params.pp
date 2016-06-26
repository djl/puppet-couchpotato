# == Class: couchpotato::params
class couchpotato::params {
  $install_dir = '/usr/share/couchpotato'
  $data_dir    = '/var/lib/couchpotato'
  $user        = 'couchpotato'
  $user_shell  = '/bin/false'
  $manage_user = true
  $repo        = 'https://github.com/RuudBurger/CouchPotatoServer.git'
}
