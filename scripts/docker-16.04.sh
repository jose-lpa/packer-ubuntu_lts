# Ensure that APT system can deal with HTTPS
apt-get -y install apt-transport-https

# Add official Docker repository key to local keychain
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Add official Docker repository to APT sources
echo 'deb https://apt.dockerproject.org/repo ubuntu-xenial main' > /etc/apt/sources.list.d/docker.list

# Update APT and install recommended packages
apt-get -y update
apt-get -y install linux-image-extra-$(uname -r) linux-image-extra-virtual
apt-get -y install docker-engine

# Create the 'docker' system group and add 'vagrant' user to it.
# This allows the standard 'vagrant' user to use Docker without sudo'ing.
groupadd docker
gpasswd -a vagrant docker
