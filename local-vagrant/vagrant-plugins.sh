#!/usr/bin/env bash

function install_vagrant_plugin() {
  local plugin=$1;
  if [ "$(vagrant plugin list | grep $plugin -c)" -eq 0 ];
  then
    vagrant plugin install $plugin
  else
    echo "Vagrant plugin $plugin is already installed ...";
  fi
}

install_vagrant_plugin vagrant-host-shell
install_vagrant_plugin vagrant-vbguest
