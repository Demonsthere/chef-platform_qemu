require_relative '../spec_helper'

# ----------------------------
# qemu & packer specs
# ----------------------------
packages = %w(qemu linaro-image-tools debootstrap)

packages.each do |pkg|
  describe package(pkg) do
    it { should be_installed }
  end
end

describe file('/usr/bin/packer') do
  it { should be_file }
  it { should be_executable }
end

describe file('/') do
  it { should be_mounted }
end

describe file('/proc/sys/fs/binfmt_misc') do
  it { should be_mounted }
end

describe command('packer version') do
  its(:exit_status) { should eq 0 }
end