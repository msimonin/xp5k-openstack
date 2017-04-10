# Module:: scenario
# Manifest:: openstack/mysql.pp
#

class scenario::openstack::mysql {

  $override_options = {
    'mysqld' => {
      'max_connections' => 500
    }
  }

  class {
    '::mysql::server':
      override_options     => $override_options;
  }

}
