#!/usr/bin/env bash

function gen_key() {

  # -f - file name
  # -N - passphrase
  # -o - overwrite
  ssh-keygen -t rsa -f ./do-packer-terraform -N -o ''
}
