#
# Cookbook Name:: php56
# Recipe:: centos
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# add the EPEL repo
dist = node['lsb']['codename']
apt_repository 'ppa' do
  uri "http://ppa.launchpad.net/ondrej/php5-5.6/ubuntu/"
  distribution dist
  components ["main"]
  action :add
end


# install packages
%w{
	php5
	php5-dev
	php5-curl
	php5-gd
	php5-json
	php5-mysql
	libphp5-embed
	php5-xdebug
}.each do |p|
	package p do
		action :install
		options "--force-yes"
	end
end


