#!/usr/bin/env bash

function install_vagrant_plugin() {
  local plugin=$1;
  if [ "$(vagrant plugin list | grep $plugin -c)" -eq 0 ];
  then
    vagrant plugin install $plugin
  fi
}

install_vagrant_plugin vagrant-alpine
install_vagrant_plugin vagrant-host-shell
install_vagrant_plugin vagrant-vbguest

vagrant up
