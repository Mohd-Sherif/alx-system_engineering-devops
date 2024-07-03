# install flask from pip3

#package { 'flask':
#  ensure   => '2.1.0',
#  provider => 'pip3',
#}

# Ensure pip3 is installed
package { 'python3-pip':
  ensure => present,
}

# Install Werkzeug version compatible with Flask 2.1.0
package { 'Werkzeug':
  ensure   => '2.1.1',
  provider => 'pip3',
  require  => Package['python3-pip'],
}

# Install Flask version 2.1.0 using pip3
package { 'Flask':
  ensure   => '2.1.0',
  provider => 'pip3',
  require  => Package['python3-pip'],
}
