#!/bin/bash

# Add user to group
user_add_to_group() {
    local group="$1"
    local user="$2"
    usermod -a -G "$group" "$user"
}

# Delete user
user_delete() {
    local user="$1"
    userdel "$user"
}

# Add user
add_user() {
    local user="$1"
    adduser "$user"
}

# Change user password
change_password() {
    local user="$1"
    passwd "$user"
}

# Add group
add_group() {
    local group="$1"
    groupadd "$group"
}

# Remove user from group
remove_user_from_group() {
    local user="$1"
    local group="$2"
    deluser "$user" "$group"
}

# User menu
user_menu() {
    echo "User Menu"
    echo "---------"
    echo "1. Add user to group"
    echo "2. Delete user"
    echo "3. Add user"
    echo "4. Change user password"
    echo "5. Add group"
    echo "6. Remove user from group"
    echo "0. Exit"

    local choice
    read -p "Enter your choice: " choice

    case "$choice" in
        1)
            read -p "Enter group name: " group
            read -p "Enter user name: " user
            user_add_to_group "$group" "$user"
            ;;
        2)
            read -p "Enter user name: " user
            user_delete "$user"
            ;;
        3)
            read -p "Enter user name: " user
            add_user "$user"
            ;;
        4)
            read -p "Enter user name: " user
            change_password "$user"
            ;;
        5)
            read -p "Enter group name: " group
            add_group "$group"
            ;;
        6)
            read -p "Enter user name: " user
            read -p "Enter group name: " group
            remove_user_from_group "$user" "$group"
            ;;
        0)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid choice. Please try again."
            ;;
    esac
}

# Usage example for user_menu.sh

user_menu
