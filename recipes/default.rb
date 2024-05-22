#
# Cookbook:: acep-portainer
# Recipe:: default
#
# Copyright:: 2024, The Authors, All Rights Reserved.

docker_installation 'default'

docker_service 'default' do
  data_root node['docker']['data_mount_point']
  action [:create, :start]
end

# internal recipe will handle running the correct items based on the role.
include_recipe 'acep-portainer::server'
include_recipe 'acep-portainer::agent'