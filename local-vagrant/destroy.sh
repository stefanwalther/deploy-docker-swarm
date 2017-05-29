#!/usr/bin/env bash

vagrant --config-file="config.prod.yml" -- destroy -f

rm -rf ./.vagrant/
