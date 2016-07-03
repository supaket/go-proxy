VAGRANTFILE_API_VERSION = 2
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  if Vagrant.has_plugin?("vagrant-cachier")
    config.cache.scope = :machine
    config.cache.synced_folder_opts = {
      type: :nfs,
      mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
    }
  end

  #master nodes
  config.vm.define "master" do |master|  
    master.vm.box = "centos/7"
    master.vm.network "private_network", ip: "192.168.10.2"
    master.vm.network "forwarded_port", guest: 5432, host:5432    
    master.vm.provision :shell, :path => "setup-swarm-master.sh", privileged: false
  end

  #slave nodes
  NUM_NODES = 2
  (1..NUM_NODES).each do |i|
      config.vm.define "node#{i}" do |node|
        node.vm.box = "centos/7"
        node.vm.network "private_network", ip: "192.168.10.1#{i}"
	node.vm.provision :shell, :path => "setup-swarm-node.sh", privileged: false
    end
  end

end
