# Chef InSpec test for recipe acep-portainer::default

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

describe service('docker') do
  it { should be_running }
  it { should be_enabled }
end
