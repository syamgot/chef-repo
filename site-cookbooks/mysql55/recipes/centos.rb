#
# Cookbook Name:: mysql55
# Recipe:: centos
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


# add the EPEL repo
yum_repository 'epel' do
  description 'Extra Packages for Enterprise Linux'
  mirrorlist 'http://mirrors.fedoraproject.org/mirrorlist?repo=epel-6&arch=$basearch'
  gpgkey 'http://dl.fedoraproject.org/pub/epel/RPM-GPG-KEY-EPEL-6'
  action :create
end

# add the Remi repo
yum_repository 'remi' do
  description 'Les RPM de Remi - Repository'
  baseurl 'http://rpms.famillecollet.com/enterprise/6/remi/x86_64/'
  gpgkey 'http://rpms.famillecollet.com/RPM-GPG-KEY-remi'
  fastestmirror_enabled true
  action :create
end


# install
package 'mysql-server' do
	action :install
	options "--enablerepo=remi"
end

# service
service 'mysqld' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable , :start ]
end

=begin

# my.cnf
template 'my.cnf' do
  path '/etc/my.cnf'
  source 'my.cnf.erb'
  owner 'root'
  group 'root'
  mode 644
  notifies :restart, "service[mysqld]"
end


# log files
mysql_log_dir = '/var/log/mysql'
directory mysql_log_dir do
  owner 'root'
  group 'root'
  mode  '0755'
  action :create
end
 
# touch log files
%w[
  error
  slow
  query
].each do |log_name|
  bash "create_#{log_name}_log" do
    log_file = "#{mysql_log_dir}/#{log_name}.log"
    code <<-EOC
      touch #{log_file}
    EOC
    creates log_file
  end
end

=end

