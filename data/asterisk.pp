yumrepo { 'asterisk-common':
  # baseurl => 'https://ast.tucny.com/repo/asterisk-common/el$releasever/$basearch/',
  descr => 'Asterisk Common Requirement Packages @ tucny.com',
  enabled => '1',
  gpgcheck => '1',
  gpgkey => 'https://ast.tucny.com/repo/RPM-GPG-KEY-dtucny',
  mirrorlist => 'https://ast.tucny.com/mirrorlist.php?release=$releasever&arch=$basearch&repo=asterisk-common',
}
-> yumrepo { 'asterisk-13':
  # baseurl => 'baseurl=https://ast.tucny.com/repo/asterisk-13/el$releasever/$basearch/',
  descr => 'Asterisk 13 (LTS) Packages @ tucny.com',
  enabled => '1',
  gpgcheck => '1',
  gpgkey => 'https://ast.tucny.com/repo/RPM-GPG-KEY-dtucny',
  mirrorlist => 'https://ast.tucny.com/mirrorlist.php?release=$releasever&arch=$basearch&repo=asterisk-13',
}
-> yumrepo { 'irontec':
  baseurl => 'http://packages.irontec.com/centos/$releasever/$basearch/',
  descr => 'The irontec repository',
  enabled => '1',
  gpgcheck => '0',
}
-> package { [
                "asterisk",
                "asterisk-oss",
                "asterisk-sip",
                "asterisk-sounds-core-en-alaw",
                "augeas",
                "mlocate",
                "net-tools",
                "ngrep",
                "rsync",
                "sngrep",
                "wget",
                "vim",
          ]:
  ensure => installed,
  allow_virtual => true,
}
-> file { '/etc/asterisk':
  ensure => 'directory',
  recurse => 'remote',
  mode => '0640',
  source => 'file:///vagrant/files/etc/asterisk',
  owner => 'asterisk',
  group => 'asterisk',
}
~> service { 'asterisk':
  ensure => running,
  enable => true,
  hasrestart => true,
  hasstatus  => true,
}
