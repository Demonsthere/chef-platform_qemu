default['platform_qemu']['release'] = 'stable'
default['platform_qemu']['packages'] = %w(python qemu linaro-image-tools debootstrap xvfb gdisk util-linux)
default['platform_qemu']['packer_version'] = '0.10.0'
default['platform_qemu']['packer_url'] = "https://releases.hashicorp.com/packer/#{node['platform_qemu']['packer_version']}/packer_#{node['platform_qemu']['packer_version']}_linux_amd64.zip"