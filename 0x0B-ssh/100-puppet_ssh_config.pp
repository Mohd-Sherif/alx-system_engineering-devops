# Puppet to make changes to our configuration file

file { '~/.ssh/config':
  ensure  => 'file',
  mode    => '0600',
  content => "
    Host *
      IdentityFile ~/.ssh/school
      PasswordAuthentication no
  ",
}
