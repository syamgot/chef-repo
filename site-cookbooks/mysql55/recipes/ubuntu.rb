#
# Cookbook Name:: mysql55
# Recipe:: ubuntu
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


# remove
package 'mysql-server' do
	action :remove
end

# install
package 'mysql-server' do
	action :install
end

# service
service 'mysql' do
  supports :status => true, :restart => true, :reload => true
  action [ :enable , :start ]
end

