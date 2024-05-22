#
# Cookbook:: acep-portainer
# Recipe:: agent
#
# Copyright:: 2024, The Authors, All Rights Reserved.

docker_image 'portainer-agent' do 
    tag '2.20.0'
    repo 'portainer/agent'
    action :pull
    only_if { node['portainer']['role'] == 'agent' }
end

docker_container 'portainer-agent' do
    repo 'portainer/agent'
    tag '2.20.0'
    port ['9001:9001']
    volumes [
        '/var/lib/docker/volumes:/var/lib/docker/volumes',
        '/var/run/docker.sock:/var/run/docker.sock'
    ]
    restart_policy 'always'
    action :run
    only_if { node['portainer']['role'] == 'agent' }
end