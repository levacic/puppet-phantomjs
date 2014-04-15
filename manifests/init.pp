class phantomjs (
  $package_version = '1.9.7', # set package version to download
  $source_url = "https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-$package_version-linux-x86_64.tar.bz2",
  $source_dir = '/opt',
  $install_dir = '/usr/local/bin',
  $package_update = false,

) {
  exec { 'get phantomjs':
    command => "wget --quiet $source_url --output-document=$source_dir/phantomjs.tar.bz2 && mkdir $source_dir/phantomjs && tar xvf $source_dir/phantomjs.tar.bz2 -C $source_dir && mv $source_dir/phantomjs-$package_version-linux-x86_64/* $source_dir/phantomjs/ && rm -rf $source_dir/phantomjs-$package_version-linux-x86_64",
    creates => "$source_dir/phantomjs/bin/phantomjs",
    require => Package['wget', 'unzip'],
  }

  file { "$install_dir/phantomjs":
    ensure => link,
    target => "$source_dir/phantomjs/bin/phantomjs",
    force => true,
  }

  if $package_update {
    exec { 'remove phantomjs':
      command => "/bin/rm -rf $source_dir/phantomjs",
      notify => Exec[ 'get phantomjs' ]
    }
  }
}
