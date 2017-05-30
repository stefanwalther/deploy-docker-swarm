#!/usr/bin/env bash

vagrant --config-file="./configs/config.yml" destroy -f

rm -rf ./.vagrant/
