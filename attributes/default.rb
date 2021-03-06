default[:platform_qemu][:user] = 'vagrant'
default[:platform_qemu][:home] = "/home/#{node[:platform_qemu][:user]}"
default[:platform_qemu][:packages] = %w(qemu qemu-user-static debootstrap xvfb gdisk util-linux binfmt-support libvirt0 libvirt-dev libvirt-daemon libvirt-daemon-system libgmp3-dev)
default[:platform_qemu][:linaro_dep] = %w(python parted dosfstools u-boot-tools python-args python-dbus python-debian python-parted btrfs-tools command-not-found python-yaml)
default[:platform_qemu][:linaro_git] = 'http://git.linaro.org/ci/linaro-image-tools.git'
default[:platform_qemu][:packer_version] = '0.10.1'
default[:platform_qemu][:packer_url] = "https://releases.hashicorp.com/packer/#{node[:platform_qemu][:packer_version]}/packer_#{node[:platform_qemu][:packer_version]}_linux_amd64.zip"
default[:platform_qemu][:vagrant_version] = '1.8.4'
default[:platform_qemu][:vagrant_url] = "https://releases.hashicorp.com/vagrant/#{node[:platform_qemu][:vagrant_version]}/vagrant_#{node[:platform_qemu][:vagrant_version]}_x86_64.deb"
default[:platform_qemu][:vagrant_plugins] = %w(vagrant-libvirt vagrant-mutate)
default[:platform_qemu][:groups] = %w(libvirt libvirt-qemu)
default[:platform_qemu][:group_users] = %w(vagrant)
