#
# Cookbook:: acep-portainer
# Recipe:: agent
#
# Copyright:: 2024, The Authors, All Rights Reserved.

docker_image 'portainer-agent' do
  tag node['portainer']['version']
  repo 'portainer/agent'
  action :pull
  only_if { node['portainer']['role'] == 'agent' }
end

# docker run -d \
#   -v /var/run/docker.sock:/var/run/docker.sock \
#   -v /var/lib/docker/volumes:/var/lib/docker/volumes \
#   -v /:/host \
#   -v portainer_agent_data:/data \
#   --restart always \
#   -e EDGE=1 \
#   -e EDGE_ID=816ff915-29f6-417d-b743-5160584f4b4e \
#   -e EDGE_KEY=aHR0cHM6Ly8xNzIuMjguMTcuMTU0Ojk0NDN8MTcyLjI4LjE3LjE1NDo4MDAwfFBqZTB4M2F6a2NaaytKeXRPRjhVU2hxMWxmdHdjTmVIN1JIZzZwNkNrckE9fDU \
#   -e EDGE_INSECURE_POLL=1 \
#   --name portainer_edge_agent \
#   portainer/agent:2.19.5

docker_container 'portainer_agent' do
  repo 'portainer/agent'
  tag node['portainer']['version']
  port ['9001:9001']
  volumes [
      '/var/lib/docker/volumes:/var/lib/docker/volumes',
      '/var/run/docker.sock:/var/run/docker.sock',
      'portainer_data:/data',
  ]
  env [
      "EDGE=#{node['portainer']['enable_edge'] ? 1 : 0}",
      "EDGE_ID=#{node['portainer']['edge_id']}",
      "EDGE_KEY=#{node['portainer']['edge_key']}",
      'EDGE_INSECURE_POLL=1',
  ]
  restart_policy 'always'
  action :run
  only_if { node['portainer']['role'] == 'agent' }
end
