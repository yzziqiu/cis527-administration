# Please manually update
# install puppet stdlib module
# sudo apt-get puppet

group {'filesgroup':
	ensure => 'present',
#	gid => '502',
}

user {'cis527':
	ensure =>'present',
	groups => 'filesgroup',
}

# install puppet stdlib module
# ``sudo puppet module install puppetlabs-stdlib

# set managehome => true
# avoid black screen

user {'adminuser':
	ensure => present,
	groups => ['sudo','filesgroup'],
	home => '/home/adminuser',
	managehome => true,
	password => pw_hash('AdminUser123','SHA-512','aRandomPassword'),
}

user {'normaluser':
	ensure => present,
	home => '/home/normaluser',
	managehome => true,
	password => pw_hash('NormalUser123','SHA-512','aRandomPassword'),
}

user {'guestuser':
	ensure => present,
	home => '/home/guestuser',
	managehome => true,
	password => pw_hash('GuestUser123','SHA-512','aRandomPassword'),
}

user {'eviluser':
	ensure => present,
	home => '/home/eviluser',
	managehome => true,
	password => pw_hash('EvilUser123','SHA-512','aRandomPassword'),
}

# sudo puppet resource user
# to see the encrypted password
# reboot

file{'files':
	path => '/files',
	ensure => 'directory',
	owner => 'root',
	group => 'root',
	mode => '0766',
}
file{'AdminUser':
	path => '/files/AdminUser',
	ensure => 'directory',
	owner => 'adminuser',
	group => ['filesgroup'],
	mode => '0770',
}
file{'NormalUser':
	path => '/files/NormalUser',
	ensure => 'directory',
	owner => 'normaluser',
	group => 'filesgroup',
	mode => '0770',
}
file{'GuestUser':
	path => '/files/GuestUser',
	ensure => 'directory',
	owner => 'guestuser',
	group => 'filesgroup',
	mode => '0770',
}
file{'EvilUser':
	path => '/files/EvilUser',
	ensure => 'directory',
	owner => 'eviluser',
	group => 'filesgroup',
	mode => '0770',
}
file{'AdminUser.txt':
	path => '/files/AdminUser/AdminUser.txt',
	ensure => 'present',
	owner => 'adminuser',
	group => 'filesgroup',
	content => 'AdminUser',
	mode => '0770',
}
file{'NormalUser.txt':
	path => '/files/NormalUser/NormalUser.txt',
	ensure => 'present',
	owner => 'normaluser',
	group => 'filesgroup',
	content => 'NormalUser',
	mode => '0770',
}
file{'GuestUser.txt':
	path => '/files/GuestUser/GuestUser.txt',
	ensure => 'present',
	owner => 'guestuser',
	group => 'filesgroup',
	content => 'GuestUser',
	mode => '0770',
}
file{'EvilUser.txt':
	path => '/files/EvilUser/EvilUser.txt',
	ensure => 'present',
	owner => 'eviluser',
	group => 'filesgroup',
	content => 'EvilUser',
	mode => '0770',
}


# sudo apt-get update

#exec{ 'apt-update':
#	command => '/usr/bin/apt-get update'
#}

# check versions
# apt-cache policy firefox

package{'firefox':
	ensure => latest,
}
package{'thunderbird':
	ensure => latest,
}


package{'apache2':
	ensure => latest,
}

package{'synaptic':
	ensure => latest,
}
package{'gufw':
	ensure => latest,
}
package{'conky':
	ensure => latest,
}
package{'clamav':
	ensure => latest,
}

# service --status-all

service{'apache2':
	ensure => running,
	require => Package['apache2'],
}

service{'clamav-freshclam':
	ensure => running,
	require => Package['clamav'],
}
