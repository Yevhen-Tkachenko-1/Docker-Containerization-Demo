#!/usr/bin/env bash

bash_is_current_version() {
  bash --version | grep -q 'version 5'
}

start_server() {
  echo "Server clock has started. Press CTRL-C to stop..."
  while true
  do
    now=$(date)
    echo "Current date and time: $now"
    sleep 1
  done
}

if ! bash_is_current_version
then
  >&2 echo "ERROR: Bash not installed or not the right version."
  exit 1
fi

start_server
