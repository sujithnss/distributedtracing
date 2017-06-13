cd ~

printf "\e[0;35m${bold}================== Docker Installation ==================\xe2\x9c\x93\e[0m \n \n"

sudo tee /etc/yum.repos.d/docker.repo <<-'EOF'
[dockerrepo]
name=Docker Repository
baseurl=https://yum.dockerproject.org/repo/main/centos/7/
enabled=1
gpgcheck=1
gpgkey=https://yum.dockerproject.org/gpg
EOF

printf "\e[0;35m${bold}--- Installing Docker Engine ---\xe2\x9c\x93\e[0m \n \n"

echo "Installing Wget"
sudo yum install -y wget

echo "Installing epel-release"
sudo yum install -y epel-release

echo "Installing supporting tools requirements on RHEL"
sudo yum install -y ruby ruby-devel gcc libxml2-devel

echo "Installing node"
sudo yum install -y nodejs

echo "Installing npm"
sudo yum install -y npm

echo "Installing iptables-services"
sudo yum install -y iptables-services

echo "Installing telnet"
sudo yum install -y telnet


sudo yum install -y docker-engine


sudo yum install -y git

cd /vagrant/

sudo git clone https://github.com/openzipkin/zipkin-js-example.git

echo "Writing iptables file in sysconfig"

sudo rm -rf /etc/sysconfig/iptables
sudo touch /etc/sysconfig/iptables
sudo echo '# sample configuration for iptables service
# you can edit this manually or use system-config-firewall
# please do not ask us to add additional ports/services to this default configuration
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
-A INPUT -p icmp -j ACCEPT
-A INPUT -i lo -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 22 -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 5555 -j ACCEPT
-A INPUT -p udp -m state --state NEW -m udp --dport 5555 -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 5556 -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 8086 -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 9000 -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 8081 -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 9411 -j ACCEPT
-A INPUT -j REJECT --reject-with icmp-host-prohibited
-A FORWARD -j REJECT --reject-with icmp-host-prohibited
COMMIT'>>/etc/sysconfig/iptables
sudo cat /etc/sysconfig/iptables

sudo echo "10.0.0.30 zipkinsdemo">>/etc/hosts
sudo cat /etc/hosts 
