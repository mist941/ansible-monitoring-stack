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
        This script collects the credentials and configuration for deploying 
        the Grafana, Prometheus, and Loki monitoring stack using Ansible.

        Necesary data:
            - Username
            - Password
            - SSH key path
            - New user name
            - New user password
            - Timezone
EOF
    exit 0
}

if [ "$#" -gt 0 ]; then
    case "$1" in
    -h | --help)
        show_help
        ;;
    esac
fi

read -p "Enter username: " username
check_empty_input "Username" "$username"

read -sp "Enter the password: " password
check_empty_input "Password" "$password"

read -p "Enter ssh key absolute path: " ssh_key_path
check_empty_input "SSH key path" "$ssh_key_path"

if [ ! -f "$ssh_key_path" ]; then
    print_error "SSH key path does not exist"
    exit 1
fi

print_success "SSH key verified"

read -p "New user name: " new_user_name
check_empty_input "New user name" "$new_user_name"

read -sp "New user password: " new_user_password
check_empty_input "New user password" "$new_user_password"

read -p "Enter the timezone: " timezone

if [ -z "$timezone" ]; then
    print_warning "Using default timezone: UTC"
    timezone="UTC"
fi

cat <<EOF
Configuration summary:
_________________________
    Username: $username
    Password: **********
    SSH key path: $ssh_key_path
    New user name: $new_user_name
    New user password: **********
    Timezone: $timezone
EOF

read -p "Continue with these settings? (y/n): " confirm

if [ "$confirm" != "y" ]; then
    print_warning "Configuration cancelled"
    exit 0
fi

print_success "All inputs collected successfully!"
