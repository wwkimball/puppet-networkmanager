class networkmanager::install {
  package { 'network-manager':
    ensure => $::networkmanager::version,
    name   => $networkmanager::package_name,
  }
  case $::networkmanager::gui {
    'gnome': {
      package { 'network-manager-gnome':
        ensure => $::networkmanager::version,
      }
    }
    'kde': {
      package { 'plasma-nm':
        ensure => present,
      }
    }
    default: {}
  }
}
