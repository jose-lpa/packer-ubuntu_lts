# Ensure that APT system can deal with HTTPS
apt-get -y install apt-transport-https

# Add official Docker repository key to local keychain
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 36A1D7869245C8950F966E92D8576A8BA88D21E9

# Add official Docker repository to APT sources
echo 'deb https://get.docker.com/ubuntu docker main' > /etc/apt/sources.list.d/docker.list

# Update APT and install 'lxc-docker' package
apt-get -y update
apt-get -y install lxc-docker
