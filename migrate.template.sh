#!/bin/bash

command=(migrate -path migrations -database ${DATABASE_URL})
"${command[@]}" "$@"