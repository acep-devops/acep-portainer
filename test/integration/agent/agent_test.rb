# Chef InSpec test for recipe acep-portainer::agent

# The Chef InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/
control 'agent' do
  title 'Agent Test'
  desc 'Test the agent recipe'

  describe docker_container('portainer-agent') do
    it { should exist }
    it { should be_running }
    its('repo') { should eq 'portainer/agent' }
    its('tag') { should eq '2.21.4' }
  end
end
