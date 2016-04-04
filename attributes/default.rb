default['platform_qemu']['release'] = 'stable'
default['platform_qemu']['packages'] = %w(python qemu linaro-image-tools debootstrap xvfb gdisk util-linux binfmt-support libvirt0 libvirt-dev)
default['platform_qemu']['packer_version'] = '0.10.0'
default['platform_qemu']['packer_url'] = "https://releases.hashicorp.com/packer/#{node['platform_qemu']['packer_version']}/packer_#{node['platform_qemu']['packer_version']}_linux_amd64.zip"
default['platform_qemu']['vagrant_version'] = '1.8.1'
default['platform_qemu']['vagrant_url'] = "https://releases.hashicorp.com/vagrant/#{node['platform_qemu']['vagrant_version']}/vagrant_#{node['platform_qemu']['vagrant_version']}_x86_64.deb"
