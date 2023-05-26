#!/bin/bash

# Change directory to /tmp
pushd /tmp

# Download the puppet7-release-jammy.deb package
wget https://apt.puppetlabs.com/puppet7-release-jammy.deb

# Install the puppet7-release-jammy.deb package
sudo dpkg -i puppet7-release-jammy.deb

# Update the package lists
sudo apt update

# Upgrade installed packages
sudo apt upgrade

# Install the puppet-agent package
sudo apt install puppet-agent

# Configure puppet.conf
echo -e "[main]\nserver = puppetv4.mdc-berlin.net\nca_server = puppetca.mdc-berlin.net\ndigest_algorithm = sha256\n## no more warnings  about the number of fact\ntop_level_facts_soft_limit = 2048\nnumber_of_facts_soft_limit = 4096" | sudo tee /etc/puppetlabs/puppet/puppet.conf

# Run the puppet agent in debug mode
sudo /opt/puppetlabs/puppet/bin/puppet agent -t -d

# Sleep for 10 seconds
sleep 10

# Shutdown the system
sudo shutdown -h now
