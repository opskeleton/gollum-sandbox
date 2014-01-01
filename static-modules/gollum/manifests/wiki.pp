# initializes an emptyl git wiki repo
class gollum::wiki($wiki='') {
  file{"/srv/${wiki}":
    ensure => directory,
  } ->

  exec{'git init .':
    cwd    => "/srv/${wiki}",
    user   => 'root',
    path   => ['/usr/bin', '/bin'],
    unless => ["/usr/bin/test -d /srv/${wiki}/.git"]
  }
}
