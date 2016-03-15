cookbook_file '/etc/apt/sources.list.d/linaro.list' do
  source 'linaro.list'
  owner 'root'
  group 'root'
  mode '0644'
  action :create_if_missing
end

execute 'Get repository key' do
  command "apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys #{node['platform_qemu']['linaro_key']}"
  creates '/tmp/something'
  action :run
end

execute 'update repository cache' do
  command 'apt-get update'
  action :run
end
