node['platform_qemu']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

cookbook_file '/tmp/set_register.sh' do
  source 'set_register.sh'
  owner 'root'
  group 'root'
  mode '0755'
end

execute 'Setup the binary register' do
  command 'sh set_register.sh'
  cwd '/tmp'
  user 'root'
  action :run
end
