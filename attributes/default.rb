default['docker']['data_mount_point'] = '/var/lib/docker'
default['portainer']['role'] = 'server' # optionally could use 'agent' for a follower agent.
default['portainer']['repo'] = 'portainer/portainer-ce' # default to community edition
# default['portainer']['repo'] = 'portainer/portainer-ee' # use this for enterprise edition
default['portainer']['enable_edge'] = false
default['portainer']['edge_id'] = ''
default['portainer']['edge_key'] = ''
default['portainer']['version'] = '2.21.4'
