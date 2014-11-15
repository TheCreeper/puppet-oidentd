# service.pp

class oidentd::service {

	if !($oidentd::service_ensure in [ 'running', 'stopped' ]) {

		fail('service_ensure parameter must be running or stopped')
	}

	if $oidentd::service_manage == true {

		service { $oidentd::service_name:

			enable => $oidentd::service_enable,
			ensure => $oidentd::service_ensure,
		}
	}
}