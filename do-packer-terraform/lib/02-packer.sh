#!/usr/bin/env bash

function pack() {
  packer build -machine-readable packer-ubuntu-docker.json | tee packer-ubuntu-docker.log;
}
