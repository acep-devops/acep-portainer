#
# Cookbook:: acep-portainer
# Recipe:: server
#
# Copyright:: 2024, The Authors, All Rights Reserved.



docker_image 'portainer' do 
    tag node['portainer']['version']
    repo 'portainer/portainer-ce'
    action :pull
    only_if { node['portainer']['role'] == 'server' }
end

docker_container 'portainer' do
    repo 'portainer/portainer-ce'
    tag node['portainer']['version']
    port ['8000:8000', '9443:9443']
    volumes [
        'portainer_data:/data',
        '/var/run/docker.sock:/var/run/docker.sock'
    ]
    action :run
    only_if { node['portainer']['role'] == 'server' }
end