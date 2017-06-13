Vagrant.configure(2) do |config|
  
  config.vm.define :zipkinsdemo do |zipkinsdemo|
    zipkinsdemo.vm.box = "bento/centos-7.1"
    zipkinsdemo.vm.network :private_network, ip: "10.0.0.30"
    zipkinsdemo.vm.hostname = "zipkinsdemo"
    zipkinsdemo.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
    end
    zipkinsdemo.vm.provision :shell, :path => "start.sh"
    zipkinsdemo.vm.provision :shell, path: "restart.sh", run: 'always'
  end

end
