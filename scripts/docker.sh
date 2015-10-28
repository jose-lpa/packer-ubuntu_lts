# Ensure that APT system can deal with HTTPS
apt-get -y install apt-transport-https

# Add official Docker repository key to local keychain
apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D

# Add official Docker repository to APT sources
echo 'deb https://apt.dockerproject.org/repo ubuntu-trusty main' > /etc/apt/sources.list.d/docker.list

# Update APT and install 'linux-image-generic-lts-trusty' package
apt-get -y update
apt-get -y install linux-image-generic-lts-trusty
apt-get -y install docker-engine

# Create the 'docker' system group and add 'vagrant' user to it.
# This allows the standard 'vagrant' user to use Docker without sudo'ing.
groupadd docker
gpasswd -a vagrant docker
service docker restart
