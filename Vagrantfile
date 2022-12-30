$install_ansible = <<-EOF
sudo apt update
sudo apt install vim wget curl ansible net-tools -y
EOF

$install_python = <<-EOF
sudo apt update
sudo apt-get install python3.6 -y
EOF

$install_docker = <<-EOF
sudo apt update
sudo apt-get install ca-certificates gnupg lsb-release -y
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
EOF


$install_docker_engine = <<-EOF
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
sudo docker run hello-world
sudo dpkg -i ./containerd.io_<version>_<arch>.deb \
  ./docker-ce_<version>_<arch>.deb \
  ./docker-ce-cli_<version>_<arch>.deb \
  ./docker-compose-plugin_<version>_<arch>.deb
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo chmod 666 /var/run/docker.sock
EOF

$install_kathara = <<-EOF
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 21805A48E6CBBA6B991ABE76646193862B759810
sudo add-apt-repository ppa:katharaframework/kathara
sudo apt update
sudo apt install kathara
EOF

$install_git = <<-EOF
sudo apt update
sudo apt install libz-dev libssl-dev libcurl4-gnutls-dev libexpat1-dev gettext cmake gcc
mkdir tmp
cd /tmp
curl -o git.tar.gz https://mirrors.edge.kernel.org/pub/software/scm/git/git-2.26.2.tar.gz
tar -zxf git.tar.gz
cd git-*
make prefix=/usr/local all
sudo make prefix=/usr/local install
exec bash
EOF

#https://www.digitalocean.com/community/tutorials/how-to-install-git-on-ubuntu-20-04

Vagrant.configure("2") do |config|
    config.vm.define "local" do |local|
        local.vm.box = "ubuntu/focal64"
        local.vm.network "private_network", ip: "10.0.0.10"
        local.vm.provider "virtualbox" do |vb|
            vb.name = "local"
            vb.memory = "512"
            vb.cpus = "2"
        end

        local.vm.provision "shell", inline: $install_ansible
        local.vm.provision "shell", inline: $install_python
        local.vm.provision "shell", inline: $install_docker
        local.vm.provision "shell", inline: $install_docker_engine
        local.vm.provision "shell", inline: $install_kathara
    end
end 
