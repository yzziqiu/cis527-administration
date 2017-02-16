# use built-in adminstrator
# cmd run as administrator typing
# net user administrator /active:yes
# net user administrator cis527_windows /active:yes

# puppet (run as admin) create group and users
# reboot

group{'FilesGroup':
	ensure => 'present',
#	gid => '502',
}
user{'AdminUser':
	ensure => 'present',
	groups => ['Administrators','FilesGroup'],
	password => ['AdminUser123'],
}

user{'cis527':
	ensure => 'present',
	groups => ['Administrators','FilesGroup'],
}

user{'NormalUser':
	ensure => 'present',
	groups => ['Users'],
	password => ['NormalUser123'],
}
user{'GuestUser':
	ensure => 'present',
	groups => ['Guests'],
	password => ['GuestUser123'],
}
user{'EvilUser':
	ensure => 'present',
	groups => ['Users'],
	password => ['EvilUser123'],
}

# puppet resource user

file{'files':
	path => 'C:\files',
	ensure => 'directory',
	owner => 'cis527',
	group => 'Administrators',
	mode => '0766',
}
file{'AdminUser':
	path => 'C:\files\AdminUser',
	ensure => 'directory',
	owner => 'AdminUser',
	group => ['FilesGroup','Administrators'],
	mode => '0770',
}
file{'NormalUser':
	path => 'C:\files\NormalUser',
	ensure => 'directory',
	owner => 'NormalUser',
	group => 'FilesGroup',
	mode => '0770',
}
file{'GuestUser':
	path => 'C:\files\GuestUser',
	ensure => 'directory',
	owner => 'GuestUser',
	group => 'FilesGroup',
	mode => '0770',
}
file{'EvilUser':
	path => 'C:\files\EvilUser',
	ensure => 'directory',
	owner => 'EvilUser',
	group => 'FilesGroup',
	mode => '0770',
}
file{'AdminUser.txt':
	path => 'C:\files\AdminUser\AdminUser.txt',
	ensure => 'present',
	owner => 'AdminUser',
	group => 'FilesGroup',
	content => 'AdminUser',
	mode => '0770',
}
file{'NormalUser.txt':
	path => 'C:\files\NormalUser\NormalUser.txt',
	ensure => 'present',
	owner => 'NormalUser',
	group => 'FilesGroup',
	content => 'NormalUser',
	mode => '0770',
}
file{'GuestUser.txt':
	path => 'C:\files\GuestUser\GuestUser.txt',
	ensure => 'present',
	owner => 'GuestUser',
	group => 'FilesGroup',
	content => 'GuestUser',
	mode => '0770',
}
file{'EvilUser.txt':
	path => 'C:\files\EvilUser\EvilUser.txt',
	ensure => 'present',
	owner => 'EvilUser',
	group => 'FilesGroup',
	content => 'EvilUser',
	mode => '0770',
}

file{'installers':
	path => 'C:\installers',
	ensure => 'directory',
	owner => 'cis527',
	group => 'Administrators',
	mode => '0766',
}

#file{'installers':
#	path => 'C:\installers',
#	ensure => 'directory',
#	owner => 'cis527',
#	group => 'Administrators',
#	mode => '0766',
# }

# all can be found in C:\installers
# silent install
# bginfo on desktop

package{'firefox':

	ensure => installed,
	source => 'C:\installers\Firefox Setup 51.0.1.exe',
	install_options => ['/S',{'INSTALLDIR' => 'C:\Firefox-51.0.1' }],
}

package{'thunderbird':
	ensure => installed,
	source => 'C:\installers\Thunderbird Setup 45.7.1.exe',
	install_options => ['/S',{'INSTALLDIR' => 'C:\Thunderbird-45.7.1' }],
}


package{'notepadplusplus':
	ensure => installed,
	source => 'C:\installers\npp.7.3.1.Installer.x64.exe',
	install_options => ['/S',{'INSTALLDIR' => 'C:\npp.7.3.1' }],
}

# find the service name
# by using run typing services.msc
# DHCP Client -> Dhcp
# DNS Client -> Dnscache
# Windows Update -> wuauserv

service{'Dhcp':
	ensure => running,
	enable => true,
}

service{'Dnscache':
	ensure => running,
	enable => true,
}

service{'wuauserv':
	ensure => running,
	enable => true,
}
