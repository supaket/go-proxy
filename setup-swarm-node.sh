curl -fsSL https://test.docker.com/ | sh
gpasswd -a vagrant docker
systemctl start docker
docker swarm join 192.168.10.2:2377
