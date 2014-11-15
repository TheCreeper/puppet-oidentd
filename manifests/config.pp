# config.pp

class oidentd::config {

	$config_ensure = $oidentd::package_ensure ? {

		'absent' => 'absent',
		'purged' => 'absent',
		default => present,
	}

	file { $oidentd::config_file:

		notify => Service[$oidentd::service_name],

		ensure => $config_ensure,
		mode => '0644',
		owner => 'root',
		group => 'root',
		content => template($oidentd::config_template),
	}->
	file { $oidentd::config_masq_file:

		notify => Service[$oidentd::service_name],

		ensure => $config_ensure,
		mode => '0644',
		owner => 'root',
		group => 'root',
		content => template($oidentd::config_masq_template),
	}->
	file { $oidentd::config_default_file:

		notify => Service[$oidentd::service_name],

		ensure => $config_ensure,
		mode => '0644',
		owner => 'root',
		group => 'root',
		content => template($oidentd::config_default_template),
	}
}