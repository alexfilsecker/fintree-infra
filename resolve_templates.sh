#!/bin/bash

set -e

# Mongo
MONGO_ENV_FILE=".envs/.local/.mongo.users.env"
MONGO_TEMPLATE_FILE="docker/mongo/init-mongo.template.js"
MONGO_PROCESSED_FILE="docker/mongo/init-mongo.processed.js"

# Resolve Mongo template
./resolver.sh "$MONGO_ENV_FILE" "$MONGO_TEMPLATE_FILE" "$MONGO_PROCESSED_FILE"
