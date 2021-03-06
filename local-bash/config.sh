#!/usr/bin/env bash

# ---------------------------------------------------------------
# Configuration - setup.sh
# ---------------------------------------------------------------

# Pattern how the machines will be named, a number will be suffixed.
# (e.g. manager-1, manager-2, worker-1, worker-2, etc.)
MACHINE_NAME_MANAGER_PREFIX=manager-
MACHINE_NAME_WORKER_PREFIX=worker-

# Define the amount of managers and workers
NUM_MANAGERS=3
NUM_WORKERS=2
