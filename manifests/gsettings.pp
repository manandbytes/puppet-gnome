# == Definition: gnome::gsettings
#
# Sets a configuration key in Gnome's GSettings registry.
#
define gnome::gsettings(
  $user   = 'root',
  $schema = undef,
  $key    = undef,
  $value  = undef,
) {
  exec { "gsettings: change-${schema}-${key} to ${value} for user ${user}":
    user    => $user,
    command => "/usr/bin/gsettings set ${schema} ${key} \"${value}\"",
    unless  => "/usr/bin/gsettings get ${schema} ${key} | grep -qF \"${value}\" ",
  }
}
