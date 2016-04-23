execute 'update repository cache' do
  command 'apt-get update'
  action :run
end

node['platform_qemu']['packages'].each do |pkg|
  apt_package pkg do
    action :upgrade
    default_release node['platform_qemu']['release']
  end
end

node['platform_qemu']['groups'].each do |grp|
  group grp do
    action :modify
    members node['platform_qemu']['users']
    append true
  end
end