#!/usr/bin/env bash

function gen_key() {

  # -f - file name
  # -N - passphrase
  # -o - overwrite
  mkdir -p ./.ssh/
  echo -e 'y\n'|ssh-keygen -q -t rsa -f ./.ssh/do-packer-terraform -o -N '' 1>/dev/null
}
