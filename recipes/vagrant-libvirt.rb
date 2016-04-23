remote_file "#{Chef::Config[:file_cache_path]}/vagrant_#{node['platform_qemu']['vagrant_version']}_x86_64.deb" do
  owner 'root'
  group 'root'
  mode '0644'
  source node['platform_qemu']['vagrant_url']
  action :create_if_missing
end

dpkg_package "vagrant_#{node['platform_qemu']['vagrant_version']}_x86_64.deb" do
  source "#{Chef::Config[:file_cache_path]}/vagrant_#{node['platform_qemu']['vagrant_version']}_x86_64.deb"
end

node['platform_qemu']['vagrant_plugins'].each do |plugin|
  execute 'Install librivt plugin for vagrant' do
    command "vagrant plugin install #{plugin}"
    user 'vagrant'
    action :run
  end
end
