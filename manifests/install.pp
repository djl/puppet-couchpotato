# == Class: couchpotato::install
class couchpotato::install() inherits couchpotato::params {
  ensure_packages(['git'])

  if ($couchpotato::manage_user) {
    user { $couchpotato::user:
      ensure => present,
      shell  => $couchpotato::user_shell,
      home   => $couchpotato::data_dir,
    }
  }

  vcsrepo { $couchpotato::install_dir:
    ensure   => present,
    provider => git,
    source   => $couchpotato::repo,
    owner    => $couchpotato::user,
    group    => $couchpotato::user,
    require  => [ User[$couchpotato::user], Package['git'] ]
  }

  file { $couchpotato::data_dir:
    ensure  => directory,
    mode    => '0755',
    owner   => $couchpotato::user,
    group   => $couchpotato::user,
    require => User[$couchpotato::user]
  }
}
