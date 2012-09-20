Veewee::Session.declare({
  :cpu_count => '2',
  :memory_size=> '512',
  :disk_size => '40960',
  :disk_format => 'VDI',
  :hostiocache => 'off',
  :os_type_id => 'Debian_64',
  :iso_file => "debian-wheezy-DI-b2-amd64-netinst.iso",
  :iso_src => "http://cdimage.debian.org/cdimage/wheezy_di_beta2/amd64/iso-cd/debian-wheezy-DI-b2-amd64-netinst.iso",
  :iso_md5 => `curl -s http://cdimage.debian.org/cdimage/wheezy_di_beta2/amd64/iso-cd/MD5SUMS -o - | awk '{if ( $2 == "debian-wheezy-DI-b2-amd64-netinst.iso") print $1 }'`.strip,
  :iso_download_timeout => "1000",
  :boot_wait => "10", :boot_cmd_sequence => [
    '<Esc>',
    'install ',
    'preseed/url=http://%IP%:%PORT%/preseed.cfg ',
    'debian-installer=en_US auto locale=en_US ',
    'kbd-chooser/method=us netcfg/get_hostname=%NAME% ',
    'netcfg/get_domain=vagrantup.com fb=false ',
    'debconf/frontend=noninteractive ',
    'console-setup/ask_detect=false ',
    'console-keymaps-at/keymap=us ',
    '<Enter>'
  ],
  :kickstart_port => "7122",
  :kickstart_timeout => "10000",
  :kickstart_file => "preseed.cfg",
  :ssh_login_timeout => "10000",
  :ssh_user => "vagrant",
  :ssh_password => "vagrant",
  :ssh_key => "",
  :ssh_host_port => "7222",
  :ssh_guest_port => "22",
  :sudo_cmd => "echo '%p'|sudo -S sh '%f'",
  :shutdown_cmd => "halt -p",
  :postinstall_files => [ "postinstall.sh" ],
  :postinstall_timeout => "10000"
})
