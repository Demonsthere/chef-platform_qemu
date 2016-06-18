#
# Cookbook Name:: platform_qemu
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
include_recipe 'platform_qemu::preparation'
# include_recipe 'platform_qemu::set_qemu'
include_recipe 'platform_qemu::packer'
include_recipe 'platform_qemu::vagrant-libvirt'
