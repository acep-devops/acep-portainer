# acep-portainer

This cookbook sets up and configures docker and portainer for managing Docker environments.

## Requiremetns

* Chef 16.0 or higher
* Ubuntu >= 22.04


## Attributes



## Usage

To use this cookbook you will need to include the default recipe and modify any required attributes

1. Add cookbook dependency to the `metadata.rb`

    ```ruby
    depends 'acep-portainer'
    ```

1. Add cookbook entry to the `Policyfile.rb` with the git repo location

    ```ruby
    cookbook 'acep-portainer', git: 'https://github.com/acep-devops/acep-portainer', branch: 'main'
    ```

1. Include the cookbook in your runlist or in the cookbook recipe

    ```json
    {
        "run_list": [
            "recipe[acep-portainer::default]"
        ]
    }
    ```

    or cookbook recipe include

    ```ruby
    include_recipe 'acep-portainer::default'
    ```

1. Customize the Attributes (Optional)
    In the cookbook that's include portainer cookbook add the following attributes to customize the installation. These attributes are optional and the default should install a working portainer server instance.

    ```ruby
    default['docker']['data_mount_point'] = '/var/lib/docker'
    default['portainer']['role'] = 'server' 
    #default['portainer']['role'] = 'agent' 
    default['portainer']['version'] = '2.21.4'
    ```

1. Converge the node

    ```bash
    sudo chef-client --once
    ```
