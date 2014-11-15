# install.pp

class oidentd::install {

	package { $oidentd::package_name:

		ensure => $oidentd::package_ensure,
	}

	if $oidentd::package_database_manage == true {

		package { $oidentd::package_database_name:

			ensure => $oidentd::package_database_ensure,
		}
	}
}