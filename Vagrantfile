# Three small Ubuntu servers for the Ansible track: two web servers and a database.
# Start them with: vagrant up
Vagrant.configure("2") do |config|
  config.vm.box = "bento/ubuntu-24.04"
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.provider "vmware_desktop" do |v|
    v.memory = 1024
    v.cpus = 1
    v.vmx["ethernet0.pcislotnumber"] = "160"
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 1024
    v.cpus = 1
  end

  %w[web1 web2 db1].each do |name|
    config.vm.define name do |node|
      node.vm.hostname = name
    end
  end
end
