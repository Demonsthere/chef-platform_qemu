require_relative '../spec_helper'

# ----------------------------
# qemu & packer specs
# ----------------------------
packages = %w(qemu vagrant debootstrap)

packages.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe file('/usr/bin/packer') do
  it { should be_file }
  it { should be_executable }
end

# describe file('/etc/default/.register_set') do
#   it { should exist }
# end

describe file('/proc/sys/fs/binfmt_misc') do
  it { should be_mounted }
end

describe file('/proc/sys/fs/binfmt_misc/qemu-arm') do
  it { should exist }
  its(:content) { should match('enabled') }
end

describe file('/proc/sys/fs/binfmt_misc/status') do
  it { should exist }
  its(:content) { should match('enabled') }
end

describe command('linaro-media-create -v') do
  its(:exit_status) { should eq 0 }
  its(:stderr) { should contain('linaro-media-create') }
  its(:stderr) { should contain('qemu-arm version') }
end

describe command('packer version') do
  its(:exit_status) { should eq 0 }
end

describe command('vagrant version') do
  its(:exit_status) { should eq 0 }
end

describe command('vagrant plugin list') do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should contain('vagrant-libvirt') }
end
