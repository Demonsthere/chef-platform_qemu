default['platform_qemu']['release'] = 'jessie'
default['platform_qemu']['linaro_key'] = '7BE1F97B'
default['platform_qemu']['packages'] = %w(linaro-image-tools qemu debootstrap)
default['platform_qemu']['packer_version'] = '0.10.0'
default['platform_qemu']['packer_url'] = "https://releases.hashicorp.com/packer/#{node['platform_qemu']['packer_version']}/packer_#{node['platform_qemu']['packer_version']}_linux_amd64.zip"