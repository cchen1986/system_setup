#!/bin/bash -e

if [[ "$OSTYPE" == "darwin"* ]]; then
  # Mac setup
  sh ./mac_setup.sh
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux setup
  sh ./linux_setup.sh
else
  echo "Unsupported machine type!"
fi
