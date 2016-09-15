# Install latest Setuptools system-wide.
curl https://bootstrap.pypa.io/ez_setup.py -o - | python

# Install Pip.
easy_install pip

# Install Virtualenv + Virtualenvwrapper.
pip install virtualenv virtualenvwrapper

# Configure Virtualenvwrapper.
cat <<EOF >> /home/vagrant/.bashrc
# Virtualenvwrapper configuration.
export WORKON_HOME=\$HOME/.virtualenvs
export PROJECT_HOME=\$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh
EOF

# Clean Setuptools installation files.
rm -v setuptools*.zip
