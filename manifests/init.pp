class midserver{

  package { 'unzip':
    ensure => installed,
  }

  file{'/servicenow':
    ensure => directory,
  }

}