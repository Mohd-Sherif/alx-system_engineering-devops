# Ensure the package is installed, the service is running, and the configuration file is set up properly.
class { 'nginx':
  package_ensure => 'present',
  service_ensure => 'running',
  service_enable => true,
}

# Define the custom configuration for Nginx
file { '/etc/nginx/sites-available/default':
  ensure  => file,
  content => template('nginx/default.erb'),
  notify  => Service['nginx'],
}

# Define the content of the Nginx root page
file { '/var/www/html/index.html':
  ensure  => file,
  content => 'Hello World!',
  require => Package['nginx'],
}

# Ensure the Nginx service is managed by Puppet
service { 'nginx':
  ensure     => running,
  enable     => true,
  require    => File['/etc/nginx/sites-available/default'],
  subscribe  => File['/var/www/html/index.html'],
}

# Create a template for the Nginx site configuration
file { '/etc/puppetlabs/code/environments/production/modules/nginx/templates/default.erb':
  ensure  => file,
  content => @("EOF"),
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    root /var/www/html;
    index index.html;

    server_name _;

    location / {
        try_files \$uri \$uri/ =404;
    }

    location /redirect_me {
        return 301 http://\$host/;
    }
}
| EOF
}

