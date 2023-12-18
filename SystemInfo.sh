#!/bin/bash

# Function to get the kernel version and BSD version.
getKernelVersion() {
    uname -a
}

# Function to get the full release info of any LSB distribution.
getLSBReleaseInfo() {
    lsb_release -a
}

# Function to show how long the system has been running and the load.
getUptime() {
    uptime
}

# Function to get the system's host name.
getHostname() {
    hostname
}

# Function to display the IP address of the host (Linux only).
getIPAddress() {
    hostname -i
}

# Function to display the description of the file system hierarchy.
getFilesystemHierarchy() {
    man hier
}

# Function to show the system reboot history.
getRebootHistory() {
    last reboot
}

## Unit Tests

# Test getKernelVersion function
test_getKernelVersion() {
    local result
    result=$(getKernelVersion)
    if [ -n "$result" ]; then
        echo "Test getKernelVersion Passed!"
    else
        echo "Test getKernelVersion Failed!"
    fi
}

# Test getLSBReleaseInfo function
test_getLSBReleaseInfo() {
    local result
    result=$(getLSBReleaseInfo)
    if [ -n "$result" ]; then
        echo "Test getLSBReleaseInfo Passed!"
    else
        echo "Test getLSBReleaseInfo Failed!"
    fi
}

# Test getUptime function
test_getUptime() {
    local result
    result=$(getUptime)
    if [ -n "$result" ]; then
        echo "Test getUptime Passed!"
    else
        echo "Test getUptime Failed!"
    fi
}

# Test getHostname function
test_getHostname() {
    local result
    result=$(getHostname)
    if [ -n "$result" ]; then
        echo "Test getHostname Passed!"
    else
        echo "Test getHostname Failed!"
    fi
}

# Test getIPAddress function
test_getIPAddress() {
    local result
    result=$(getIPAddress)
    if [ -n "$result" ]; then
        echo "Test getIPAddress Passed!"
    else
        echo "Test getIPAddress Failed!"
    fi
}

# Test getFilesystemHierarchy function
test_getFilesystemHierarchy() {
    local result
    result=$(getFilesystemHierarchy)
    if [ -n "$result" ]; then
        echo "Test getFilesystemHierarchy Passed!"
    else
        echo "Test getFilesystemHierarchy Failed!"
    fi
}

# Test getRebootHistory function
test_getRebootHistory() {
    local result
    result=$(getRebootHistory)
    if [ -n "$result" ]; then
        echo "Test getRebootHistory Passed!"
    else
        echo "Test getRebootHistory Failed!"
    fi
}

# Run all unit tests
test_getKernelVersion
test_getLSBReleaseInfo
test_getUptime
test_getHostname
test_getIPAddress
test_getFilesystemHierarchy
test_getRebootHistory
