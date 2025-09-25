#!/bin/bash
set -e

# Argument
ENV_TYPE="$1"

# Validation
if [ -z "$ENV_TYPE" ]; then
    echo "Usage: $0 <local|prd>"
    exit 1
fi

if [[ "$ENV_TYPE" != "local" && "$ENV_TYPE" != "prd" ]]; then
    echo "Error: environment must be either 'local' or 'prd'"
    exit 1
fi

# Helper function to resolve a template
resolve_template() {
    local env_file="$1"
    local template_file="$2"
    local processed_file="$3"

    ./resolver.sh "$env_file" "$template_file" "$processed_file"
}

# Mongo
resolve_template \
    ".envs/.${ENV_TYPE}/.mongo.users.env" \
    "docker/mongo/init-mongo.template.js" \
    "docker/mongo/init-mongo.processed.js"

# Migrate
resolve_template \
  ".envs/.${ENV_TYPE}/.postgres.url.env" \
  "migrate.template.sh" \
  "migrate.processed.sh" 
