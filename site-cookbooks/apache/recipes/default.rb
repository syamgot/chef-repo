#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#



case node['platform']
	when 'ubuntu'
		apache = 'apache2'
	when 'centos', 'redhat'
		apache = 'httpd'
end

package apache do
  action :install
end

service apache do
	action [ :enable, :start ]
end


