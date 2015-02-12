# Reducing the final size of the image to help Packer build a less big box.
# Credits to Vinicius Massuchetto and his helpful post in GitHub:
# http://vmassuchetto.github.io/2013/08/14/reducing-a-vagrant-box-size/

# Clean up APT packages
apt-get -y --purge remove linux-headers-$(uname -r) build-essential
apt-get -y autoremove
apt-get -y clean

# Removing leftover leases and persistent rules
echo "Cleaning up dhcp leases"
rm /var/lib/dhcp/*

# Make sure Udev doesn't block our network
echo "Cleaning up udev rules"
mkdir /etc/udev/rules.d/70-persistent-net.rules
rm -rfv /dev/.udev/
rm -v /lib/udev/rules.d/75-persistent-net-generator.rules

# Remove Linux headers
rm -rfv /usr/src/linux-headers*

# Remove Virtualbox specific files
rm -rfv /usr/src/vboxguest* /usr/src/virtualbox-ose-guest*

# Whiteout root
echo "Whiteouting /"
count=`df --sync -kP / | tail -n1  | awk -F ' ' '{print $4}'`;
count=$((count -= 1))
dd if=/dev/zero of=/tmp/whitespace bs=1024 count=$count;
rm /tmp/whitespace;
 
# Whiteout /boot
echo "Whiteouting /boot"
count=`df --sync -kP /boot | tail -n1 | awk -F ' ' '{print $4}'`;
count=$((count -= 1))
dd if=/dev/zero of=/boot/whitespace bs=1024 count=$count;
rm /boot/whitespace;
 
# Whiteout swap 
echo "Whiteouting swap"
swappart=`cat /proc/swaps | tail -n1 | awk -F ' ' '{print $1}'`
swapoff $swappart;
dd if=/dev/zero of=$swappart;
mkswap $swappart;
swapon $swappart;

# Zero out the rest of the free space using dd.
echo "Zero out the free space to aid VM compression"
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY

echo "Adding a 2 sec delay to the interface up, to make the dhclient happy"
echo "pre-up sleep 2" >> /etc/network/interfaces
