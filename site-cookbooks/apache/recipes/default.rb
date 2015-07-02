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
		include_recipe 'apache::ubuntu'
	when 'centos', 'redhat'
		include_recipe 'apache::centos'
	else
		log("unsuppoted platform #{node['platform']}")
end


