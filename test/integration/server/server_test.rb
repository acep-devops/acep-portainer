# Chef InSpec test for recipe acep-portainer::server

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

control 'server' do 
  title 'Server Test'
  desc 'Test the server recipe'

  describe docker_container('portainer') do
    it { should exist }
    it { should be_running }
    its('repo') { should eq 'portainer/portainer-ce' }
    its('tag') { should eq '2.21.4' }
  end
end 
