#!/usr/bin/env bash

set -euo pipefail

echo "Setup running! Please wait up to 120 seconds."

waitTries=0
until [ -f /tmp/setup-complete ]; do
  sleep 1
  waitTries=$(( waitTries+1 ))
  if [ "$waitTries" -gt 120 ]; then
    echo "Failed to detect setup complete!" >&2
  fi
done

echo "Setup complete successfully!"
