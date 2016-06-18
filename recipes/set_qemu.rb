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
  not_if { ::File.exist?('/etc/default/.register_set') }
end

execute 'Create register timestamp' do
  command 'echo $(date +%c) > /etc/default/.register_set'
  action :run
end
