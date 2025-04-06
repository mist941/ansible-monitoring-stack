#!/bin/bash

read -p "Enter the timezone (e.g. Europe/Kyiv): " timezone

if [ -z "$timezone" ]; then
    echo "Timezone cannot be empty"
    exit 1
fi
