#!/usr/bin/env bash

MANAGERS=2
WORKERS=2
while getopts :m:w: option
do
  case "$option" in
  m)
    MANAGERS=$OPTARG
    ;;
  w)
    WORKERS=$OPTARG
    ;;
  *)
      return
      ;;
      esac
done

echo "Managers: $MANAGERS"
echo "Workers: $WORKERS"
