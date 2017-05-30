#!/bin/bash

# defaults
CONFIG_FILE=./configs/config.yml

# https://stackoverflow.com/a/28466267/120981
while getopts c:-: arg; do
  case $arg in
    c )  CONFIG_FILE="$OPTARG" ;;
    - )  LONG_OPTARG="${OPTARG#*=}"
         case $OPTARG in
           config-file=?* )   CONFIG_FILE="$LONG_OPTARG" ;;
           config-file*   )   echo "No arg for --$OPTARG option" >&2; exit 2 ;;
           '' )               break ;; # "--" terminates argument processing
           * )                echo "Illegal option --$OPTARG" >&2; exit 2 ;;
         esac ;;
    \? ) exit 2 ;;            # getopts already reported the illegal option
  esac
done
shift $((OPTIND-1))           # remove parsed options and args from $@ list


# -- main processing
vagrant --config-file=${CONFIG_FILE} destroy -f

rm -rf ./.vagrant/

