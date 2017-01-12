#
# Cookbook Name:: lemp-stack
# Recipe:: default
#
# Copyright 2017, James Whiteley
#
# All rights reserved - Do Not Redistribute
#

execute 'update-upgrade' do
  command 'apt-get dist-upgrade -y && apt-get update -y && apt-get upgrade -y'
  action :run
end

include_recipe 'lemp-stack::nginx'
include_recipe 'lemp-stack::mysql'
include_recipe 'lemp-stack::php7'
include_recipe 'lemp-stack::redis'