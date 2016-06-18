cookbook_file '/etc/apt/sources.list.d/unstable.list' do
  source 'unstable.list'
  owner 'root'
  group 'root'
  mode '0644'
end

execute 'update repository cache' do
  command 'apt-get update'
  action :run
end

node[:platform_qemu][:packages].each do |pkg|
  apt_package pkg do
    options '-o APT::Force-LoopBreak=1'
  end
end

node[:platform_qemu][:linaro_dep].each do |dep|
  apt_package dep
end

execute 'Backup original sfdisk' do
  command 'mv sfdisk sfdisk.back'
  cwd '/sbin/'
  action :run
end

cookbook_file '/sbin/sfdisk' do
  owner 'root'
  group 'root'
  mode '0755'
  source 'sfdisk'
end

git '/usr/sbin/linaro-image-tools' do
  repository node[:platform_qemu][:linaro_git]
  reference 'master'
  action :sync
end

%w(linaro-hwpack-append linaro-hwpack-create linaro-hwpack-replace linaro-media-create linaro-android-media-create linaro-hwpack-convert linaro-hwpack-install).each do |bin|
  link "usr/sbin/#{bin}" do
    to "/usr/sbin/linaro-image-tools/#{bin}"
  end
end

node[:platform_qemu][:groups].each do |grp|
  group grp do
    action :modify
    members node[:platform_qemu][:users]
    append true
  end
end
