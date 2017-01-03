define midserver::instance(
  $download,
  $instance,
  $username,
  $password,
  ){

  $path = "/servicenow/${title}"
  $url = split($download, '/')
  $zip = $url[-1]

  file{$path:
    ensure => directory,
  }

  archive{"${title} Download":
    ensure       => present,
    extract      => true,
    path         => "${path}/${zip}",
    extract_path => $path,
    source       => $download,
    creates      => "${path}/agent",
  }

  file{"${path}/agent/config.xml":
    ensure  => file,
    content => epp('midserver/config.xml.epp',{
      'name'     => $name,
      'username' => $username,
      'password' => $password,
      'instance' => $instance,
      })
  }

  exec{"Start ${title}":
    cwd       => "${path}/agent/",
    command   => "${path}/agent/start.sh",
    logoutput => true,
    unless    => "/bin/test -e ${path}/agent/logs/agent0.log.0.lck",
  }

}