#
# Cookbook Name:: mysql55
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#



case node['platform']
	when 'ubuntu'
		include_recipe 'mysql55::ubuntu'
	when 'centos', 'redhat'
		include_recipe 'mysql55::centos'
	else
		log("unsuppoted platform #{node['platform']}")
end


