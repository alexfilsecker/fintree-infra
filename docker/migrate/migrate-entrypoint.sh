#!/bin/sh
set -e

# Optional: debug
echo "Running migration with:"
echo "POSTGRES_USER=$POSTGRES_USER"
echo "POSTGRES_PASSWORD=$POSTGRES_PASSWORD"
echo "COMMAND=$@"

# Run migration
migrate -path /migrations -database "postgres://$POSTGRES_USER:$POSTGRES_PASSWORD@fintree-db:5432/fintree?sslmode=disable" "$@"
