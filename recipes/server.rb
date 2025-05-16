#
# Cookbook:: acep-portainer
# Recipe:: server
#
# Copyright:: 2024, The Authors, All Rights Reserved.

docker_image 'portainer' do
  tag node['portainer']['version']
  repo node['portainer']['repo']
  action :pull
  only_if { node['portainer']['role'] == 'server' }
end

docker_container 'portainer' do
  repo node['portainer']['repo']
  tag node['portainer']['version']
  port ['8000:8000', '9443:9443']
  volumes [
      'portainer_data:/data',
      '/var/run/docker.sock:/var/run/docker.sock',
  ]
  action :run
  only_if { node['portainer']['role'] == 'server' }
end
