# Ubuntu 14.04 LTS [Packer](http://www.packer.io/) template - Docker enabled

This template builds a VirtualBox image based on Ubuntu 14.04 LTS, with Docker
LXC enabled to be used. 

## Features
* Docker installation from official repositories (latest available version).
* Default `vagrant` user already configured to run Docker without doing `sudo`.

## Usage
1. Be sure you have Packer and [VirtualBox](https://www.virtualbox.org/)
installed in your system.
2. Clone this repository and go into it.
    * `git clone git@github.com:jose-lpa/packer-ubuntu_14.04.git`
    * `cd packer-ubuntu_14.04`
3. Run Packer to build the VM.
    * `packer build ubuntu-14.04-amd64.json`

A VM box file should be created in the working directory under the name
`ubuntu-14.04.box`.

### Running the built VM
You can now use [Vagrant](https://www.vagrantup.com/) to run it by creating a
`Vagrantfile` with this content:

```ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu-14.04-amd64"
  config.vm.box_url = "file://ubuntu-14.04.box"
end
```

And leverage and access the VM as usual with Vagrant:
    `vagrant up`
    `vagrant ssh`
