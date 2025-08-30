#!/bin/bash
set -e

# Arguments
ENV_FILE="$1"
TEMPLATE_FILE="$2"
PROCESSED_FILE="$3"

# Check arguments
if [ -z "$ENV_FILE" ] || [ -z "$TEMPLATE_FILE" ] || [ -z "$PROCESSED_FILE" ]; then
    echo "Usage: $0 <env_file> <template_file> <processed_file>"
    exit 1
fi

# Load environment variables and keep track of them
if [ -f "$ENV_FILE" ]; then
    # Only take lines that are not comments or empty
    VARS=$(grep -v '^\s*#' "$ENV_FILE" | grep -v '^\s*$' | cut -d= -f1)
    export $(grep -v '^\s*#' "$ENV_FILE" | xargs)
else
    echo "Env file not found: $ENV_FILE"
    exit 1
fi

# Process template
if [ -f "$TEMPLATE_FILE" ]; then
    envsubst < "$TEMPLATE_FILE" > "$PROCESSED_FILE"
    echo "Processed file created: $PROCESSED_FILE"
else
    echo "Template file not found: $TEMPLATE_FILE"
    exit 1
fi

# Clean up: unset all variables loaded from the env file
for var in $VARS; do
    unset $var
done
