# Module:: scenario
# Manifest:: openstack/tempest.pp
#

class scenario::openstack::tempest ( 
 String $admin_password = $scenario::openstack::params::admin_password
) inherits scenario::openstack::params {


  class { '::tempest':
    debug                => true,
    use_stderr           => false,
    log_file             => 'tempest.log',
    git_clone            => true,
    setup_venv           => true,
    tempest_repo_uri     => 'https://github.com/openstack/tempest.git',
    tempest_clone_path   => '/tmp/puppettempest',
    lock_path            => '/tmp/puppettempest',
    tempest_config_file  => '/tmp/puppettempest/etc/tempest.conf',
    configure_images     => false,
    configure_networks   => false,
    identity_uri         => 'http://127.0.0.1:5000/v2.0',
    identity_uri_v3      => 'http://127.0.0.1:5000/v3',
    admin_username       => 'admin',
    admin_tenant_name    => 'openstack',
    admin_password       => $admin_password,
    admin_domain_name    => 'Default',
    auth_version         => 'v2',
    image_name           => 'cirros',
    image_name_alt       => 'cirros_alt',
    cinder_available     => true,
    glance_available     => true,
    horizon_available    => true,
    nova_available       => true,
    neutron_available    => true,
    ceilometer_available => true,
    trove_available      => false,
    sahara_available     => false,
    heat_available       => false,
    swift_available      => false,
    public_network_name  => 'public',
    flavor_ref           => '42',
    flavor_ref_alt       => '84',
    image_ssh_user       => 'cirros',
    image_alt_ssh_user   => 'cirros',
    img_file             => 'cirros-0.3.4-x86_64-disk.img',
    img_dir              => '/tmp/puppettempest',
  }
}
