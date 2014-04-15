puppet-phantomjs
===============

Simple puppet module that installs PhantomJS - headless WebKit scriptable with a Javascript API.

Using
-----

	class { 'phantomjs': 
		package_version => '1.0.3',
		package_update => true,
		install_dir => '/usr/local/bin',
		source_dir => '/opt',
	}

Simple puppet module that installs PhantomJS

Notes
-----

This is a fork of `3fs/puppet-phantomjs`, made so as to update the source URL and default version to something that works, as of 2014-04-15.

I updated the `Modulefile` to change the URLs, but the original author is 3fs - I didn't have time to research the `Modulefile` syntax to see how to add multiple authors, etc.
