#
# Cookbook:: acep-portainer
# Recipe:: default
#
# Copyright:: 2024, The Authors, All Rights Reserved.

docker_service 'default' do
  data_root node['docker']['data_mount_point']
  storage_driver node.dig('docker', 'storage_driver') unless node.dig('docker', 'storage_driver').nil?
  action [:create, :start]
end

docker_volume 'portainer_data' do
  action :create
end

# internal recipe will handle running the correct items based on the role.
include_recipe 'acep-portainer::server'
include_recipe 'acep-portainer::agent'
