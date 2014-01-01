# https://github.com/gollum/gollum setup
class gollum($wiki='') {

  package{['vim', 'build-essential', 'ruby', 'ruby-dev',
            'libxslt1-dev', 'git-core', 'libxml2-dev',
            'libicu-dev', 'python-pygments']:
    ensure  => present
  } ->

  package{['gollum', 'github-markdown']:
    ensure   => present,
    provider => gem
  } ->


  file { '/etc/init/gollum.conf':
    ensure=> file,
    mode  => '0700',
    content => template('gollum/gollum.conf.erb'),
    owner => root,
    group => root,
  } ->

  file{'/etc/init.d/gollum':
    ensure => link,
    target => '/etc/init/gollum.conf'
  }

  file{'/srv':
    ensure => directory,
  }
}
