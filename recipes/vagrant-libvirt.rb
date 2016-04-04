remote_file "/tmp/vagrant_#{node['platform_qemu']['vagrant_version']}_x86_64.deb" do
  owner 'root'
  group 'root'
  mode '0644'
  source node['platform_qemu']['vagrant_url']
  action :create_if_missing
end

dpkg_package "vagrant_#{node['platform_qemu']['vagrant_version']}_x86_64.deb" do
  source "/tmp/vagrant_#{node['platform_qemu']['vagrant_version']}_x86_64.deb"
end

execute 'Install librivt plugin for vagrant' do
  command 'vagrant plugin install vagrant-libvirt'
  user 'vagrant'
  action :run
end
