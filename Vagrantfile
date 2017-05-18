Vagrant.require_version ">= 1.8.0"
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
#    i = 1
    i = 2
    config.vm.define "node#{i}" do |node|
        node.vm.box = "centos65"
        node.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.3/centos65-x86_64-20140116.box"
        node.vm.provider "virtualbox" do |v|
          v.name = "node#{i}"
          v.customize ["modifyvm", :id, "--memory", "4096"]
        end
        node.vm.network :private_network, ip: "10.211.55.101"
        node.vm.hostname = "10.211.55.101"
        node.vm.provision "shell" do |s|
          s.inline = "echo HOST_LANG=$1 > /etc/profile.d/host_lang.sh"
          s.args = "#{ENV['LANG']}"
        end
        node.vm.provision "shell", path: "scripts/setup-centos.sh"
        node.vm.provision "shell", path: "scripts/setup-java.sh"
        node.vm.provision "shell", path: "scripts/setup-hadoop.sh"
        node.vm.provision "shell", path: "scripts/setup-hive.sh"
        node.vm.provision "shell", path: "scripts/setup-spark.sh"
        node.vm.provision "shell", path: "scripts/setup-mysql.sh"
        node.vm.provision "shell", path: "scripts/finalize-centos.sh"
    end
end
