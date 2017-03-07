#!/usr/bin/env bash

# Copyright (c): Hilario J. Montoliu <hmontoliu@gmail.com>
# This program is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 2 of the License, or (at your
# option) any later version.  See http://www.gnu.org/copyleft/gpl.html for
# the full text of the license.

#set -o errtrace
#trap 'traperror $? $LINENO $BASH_LINENO "$BASH_COMMAND" $(printf "::%s" ${FUNCNAME[@]})'  ERR

traperror () {
    local err=$1 # error status
    local line=$2 # LINENO
    local linecallfunc=$3
    local command="$4"
    local funcstack="$5"
    echo "<---"
    echo "ERROR: line $line - command '$command' exited with status: $err"
    if [ "$funcstack" != "::" ]; then
        echo -n "   ... Error at ${funcstack} "
        if [ "$linecallfunc" != "" ]; then
            echo -n "called at line $linecallfunc"
        fi
        else
            echo -n "   ... internal debug info from function ${FUNCNAME} (line $linecallfunc)"
    fi
    echo
    echo "--->"
}

# modified, simplified version

#set -o errtrace
#trap 'err_exit $? $LINENO $BASH_LINENO "$BASH_COMMAND" $(printf "::%s" ${FUNCNAME[@]})' ERR

err_exit() {
  local err_status=$1
  local line_no=$2
  local line_call_func=$3
  local command="$4"
  local func_stack="$5"
  local err="$6"
  echo "$@"

  echo ""
  echo "${RED}Uncaught exception:${RESTORE}";
  echo "${RED}ERROR: line $line_no - command '$command' exited with status: $err_status${RESTORE}";

  echo "${SPACE}err: $err";
  echo "${SPACE}err_status: $err_status";
  echo "${SPACE}command: $command";
  echo "${SPACE}line $line_no";
  echo "${SPACE}line_call_func: $line_call_func";
  echo "${SPACE}func_stack: $func_stack";
  echo ""

  exit 1;
}
