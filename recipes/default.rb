#
# Cookbook Name:: swftp
# Recipe:: default
#
# Copyright 2013, SoftLayer Inc.
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'python::pip'

node['swftp']['packages'].each do |pkg|
  package pkg do
    action :install
  end
end

python_pip "swftp"

cookbook_file "/etc/init.d/swftp-sftp" do
  source "swftp-sftp"
  mode 0755
  owner "root"
  group "root"
  backup false
end

cookbook_file "/etc/init.d/swftp-ftp" do
  source "swftp-ftp"
  mode 0755
  owner "root"
  group "root"
  backup false
end

service "swftp-ftp" do
  supports :stop => true, :start => true, :restart => true
  if node['swftp']['ftp']['enabled']
    action :enable
  else
    action [:stop, :disable]
  end
end

service "swftp-sftp" do
  supports :stop => true, :start => true, :restart => true
  if node['swftp']['sftp']['enabled']
    action :enable
  else
    action [:stop, :disable]
  end
end

directory "/etc/swftp" do
  action :create
end

execute "generate SSH key" do
  user "root"
  creates "/etc/swftp/id_rsa"
  command "ssh-keygen -b 2048 -N \"\" -t rsa -f /etc/swftp/id_rsa"
end

template "/etc/swftp/swftp.conf" do
  source "swftp.conf.erb"
  mode 0644
  owner "root"
  group "root"
  variables({
    :auth_url => node['swftp']['auth_url'],
    :listen => node['ipaddress'],
    :port => node['swftp']['sftp']['port'],
    :ftp_port => node['swftp']['ftp']['port'],
    :conn_per_sess => node['swftp']['session_connections'],
    :conn_max => node['swftp']['max_connections'],
    :conn_timeout => node['swftp']['connection_timeout'],
    :statsd_host => node['swftp']['statsd']['host'],
    :statsd_port => node['swftp']['statsd']['port']
  })

  if node['swftp']['ftp']['enabled']
    notifies :restart, resources(:service => "swftp-ftp"), :delayed
  end

  if node['swftp']['sftp']['enabled']
    notifies :restart, resources(:service => "swftp-sftp"), :delayed
  end
end
