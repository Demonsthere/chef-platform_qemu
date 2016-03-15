template '/etc/apt/sources.list.d/linaro.list' do
  source 'linaro.erb'
  owner 'root'
  group 'root'
  mode '0644'
  action :create_if_missing
end

execute 'update repository cache' do
  command 'apt-get update'
  action :run
end

['software-properties-common', 'python-software-properties'].each do |pkg|
  package pkg do
    action :upgrade
  end
end
