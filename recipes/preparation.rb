execute 'update repository cache' do
  command 'apt-get update'
  action :run
end

node['platform_qemu']['packages'].each do |pkg|
  package pkg do
    action :upgrade
    default_release node['platform_qemu']['release']
  end
end
