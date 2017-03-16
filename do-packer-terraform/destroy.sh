#!/usr/bin/env bash

terraform destroy -force

rm -rf terraform.tfstate;
rm -rf terraform.tfstate.backup;
rm -rf tf.log;
