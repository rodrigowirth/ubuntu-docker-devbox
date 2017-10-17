VM_NAME = "ubuntu-devbox"
VM_IP = "10.10.10.10"

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "bento/ubuntu-16.04"
  config.vm.hostname = VM_NAME

  config.vm.provision "file", source: "docker.conf", destination: "/home/vagrant/docker.conf"
  config.vm.provision "file", source: "~/.gitconfig", destination: ".gitconfig"
  config.vm.provision "file", source: "alias.sh", destination: "/home/vagrant/.alias.sh"
  config.vm.provision "file", source: "~/.ssh/id_rsa", destination: "/home/vagrant/.ssh/id_rsa"
  config.vm.provision "file", source: "~/.ssh/id_rsa.pub", destination: "/home/vagrant/.ssh/id_rsa.pub"

  config.vm.provider :virtualbox do |v|
    v.name = VM_NAME
    v.memory = 4096
    v.cpus = 4
  end

  config.vm.network :private_network, ip: VM_IP, netmask: "255.255.255.0"
  config.vm.synced_folder "~/Develop", "/home/vagrant/develop", id: "dev", nfs: true, nfs_udp: false, mount_options: ['nolock,vers=3,udp']
end
