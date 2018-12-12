#!/bin/sh

sudo apt-get -y update
wget -O - https://raw.githubusercontent.com/petems/puppet-install-shell/master/install_puppet_5_agent.sh | sudo sh
