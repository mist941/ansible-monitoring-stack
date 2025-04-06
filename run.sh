#!/bin/bash

set -euo pipefail

readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[0;33m'
readonly NC='\033[0m'

print_error() {
    echo -e "${RED}ERROR: $1${NC}" >&2
}

print_success() {
    echo -e "${GREEN}SUCCESS: $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}WARNING: $1${NC}"
}

check_empty_input() {
    local var_name="$1"
    local var_value="$2"

    if [ -z "$var_value" ]; then
        print_error "$var_name cannot be empty"
        exit 1
    fi
}

show_help() {
    cat <<EOF
        Usage: $(basename "$0")
EOF
    exit 0
}

# read -p "Enter username: " username

# if [ -z "$username" ]; then
#     echo "Username cannot be empty"
#     exit 1
# fi

# read -p "Enter the password: " password

# if [ -z "$password" ]; then
#     echo "Password cannot be empty"
#     exit 1
# fi

# read -p "Enter ssh key absolute path: " ssh_key_path

# if [ ! -f "$ssh_key_path" ]; then
#     echo "SSH key path does not exist"
#     exit 1
# fi

# read -p "New user name: " new_user_name

# if [ -z "$new_user_name" ]; then
#     echo "New user name cannot be empty"
#     exit 1
# fi

# read -p "New user password: " new_user_password

# if [ -z "$new_user_password" ]; then
#     echo "New user password cannot be empty"
#     exit 1
# fi

# read -p "Enter the timezone (e.g. Europe/Kyiv): " timezone
