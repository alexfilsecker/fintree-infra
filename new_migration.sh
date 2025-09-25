#!/bin/bash

# Check if a migration name was provided
if [ -z "$1" ]; then
  echo "Error: Please provide a name for the migration."
  echo "Usage: $0 <migration_name>"
  exit 1
fi

# The command to execute
command="migrate create -ext sql -dir ./migrations -seq $1"

# Echo the command to be executed (optional, but good for debugging)
echo "Executing: $command"

# Run the command
eval "$command"