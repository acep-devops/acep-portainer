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

docker_volume 'portainer_data' do
    action :create
end

docker_image 'portainer' do 
    tag 'latest'
    repo 'portainer/portainer-ce'
    action :pull
end

docker_container 'portainer' do
    repo 'portainer/portainer-ce'
    tag 'latest'
    port ['8000:8000', '9443:9443']
    volumes [
        'portainer_data:/data',
        '/var/run/docker.sock:/var/run/docker.sock'
    ]
    action :run
end