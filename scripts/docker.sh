# Ensure that APT system can deal with HTTPS
apt-get -y install apt-transport-https

# Add official Docker repository key to local keychain
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

# Add official Docker repository to APT sources
echo 'deb https://get.docker.com/ubuntu docker main' > /etc/apt/sources.list.d/docker.list

# Update APT and install 'lxc-docker' package
apt-get -y update
apt-get -y install lxc-docker

# Create the 'docker' system group and add 'vagrant' user to it.
# This allows the standard 'vagrant' user to use Docker without sudo'ing.
groupadd docker
gpasswd -a vagrant docker
service docker restart

# Install Docker Compose
pip install docker-compose

# Install Docker Machine
curl -L https://github.com/docker/machine/releases/download/v0.4.1/docker-machine_linux-amd64 > /usr/local/bin/docker-machine
chmod +x /usr/local/bin/docker-machine

# Install Docker Squash (https://github.com/jwilder/docker-squash)
wget https://github.com/jwilder/docker-squash/releases/download/v0.1.0/docker-squash-linux-amd64-v0.1.0.tar.gz
tar -C /usr/local/bin -xzvf docker-squash-linux-amd64-v0.1.0.tar.gz
chmod +x /usr/local/bin/docker-squash
rm docker-squash-linux-amd64-v0.1.0.tar.gz
