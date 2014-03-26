#
# Cookbook Name:: weechat
# Recipe:: default
#
# Copyright (C) 2014 Matt Chun-Lum
#
# All rights reserved - Do Not Redistribute

include_recipe 'apt'

node['weechat']['required_packages'].each do |pkg|
  package pkg do
    action :install
  end
end

node['weechat']['optional_packages'].each do |pkg|
  package pkg do
    action :install
  end
end

directory '/tmp/weechat'

remote_file "/tmp/weechat/#{node['weechat']['source_tarball_name']}" do
  source node['weechat']['source']
  checksum node['weechat']['source_checksum']
  action :create_if_missing
  notifies :run, "execute[install-weechat]"
end

execute 'install-weechat' do
  cwd '/tmp/weechat'
  command <<-EOF
    tar -jxvf #{node['weechat']['source_tarball_name']}
    cd #{node['weechat']['source_dir']} && mkdir build && cd build
    cmake .. #{node['weechat']['compile_options']} && make && make install
  EOF
  action :nothing
end

