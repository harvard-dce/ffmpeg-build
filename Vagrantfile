Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider :virtualbox do |vb|
    vb.memory = 2048
    vb.cpus = 4
    vb.name = "ffmpeg-build-box"
    vb.customize ["modifyvm", :id, "--nictype1", "virtio"]
  end

  config.vm.provision 'shell',
    path: 'build_in_vagrant.sh',
    privileged: false
end
