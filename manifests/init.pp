# init.pp

class oidentd (

	$package_ensure = latest,
	$package_name = 'oidentd',

	$service_manage = true,
	$service_enable = true,
	$service_ensure = running,
	$service_name = 'oidentd',

	$config_file = '/etc/oidentd.conf',
	$config_template = 'oidentd/etc/oidentd.conf.erb',

	$config_masq_file = '/etc/oidentd_masq.conf',
	$config_masq_template = 'oidentd/etc/oidentd_masq.conf.erb',

	$config_default_file = '/etc/default/oidentd',
	$config_default_template = 'oidentd/etc/default/oidentd.erb',

	$masq_hosts = [],

	$default_options = '-mf',
	$default_user = 'oident',
	$default_group = 'oident',
	$default_behind_proxy = 'yes',
) {

	validate_string($package_ensure)
	validate_string($package_name)

	validate_bool($service_manage)
	validate_bool($service_enable)
	validate_string($service_ensure)
	validate_string($service_name)

	validate_absolute_path($config_file)
	validate_string($config_template)

	validate_absolute_path($config_masq_file)
	validate_string($config_masq_template)

	validate_absolute_path($config_default_file)
	validate_string($config_default_template)

	validate_array($masq_hosts)

	validate_string($default_options)
	validate_string($default_user)
	validate_string($default_group)
	validate_string($default_behind_proxy)

	class{ 'oidentd::install': }->
	class{ 'oidentd::config': }->
	class{ 'oidentd::service': }
}