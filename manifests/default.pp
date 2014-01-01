group{ 'puppet': ensure  => present }

node default {
  class{'gollum':
    wiki => 'play'
  }

  class{'gollum::wiki':
    wiki => 'play'
  }
}

