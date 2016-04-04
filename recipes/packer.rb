remote_file '/tmp/packer.zip' do
  owner 'root'
  group 'root'
  mode '0644'
  source node['platform_qemu']['packer_url']
end

execute 'unzip packer' do
  command 'unzip -uo packer.zip -d /usr/bin/'
  cwd '/tmp'
  user 'root'
  action :run
end
