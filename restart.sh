echo "Restarting iptables-services"
service iptables restart

service iptables status
sudo service docker start
docker run -d -p 9411:9411 openzipkin/zipkin

cd /vagrant/zipkin-js-example/
sudo npm install
sudo npm run browserify
sudo npm start
