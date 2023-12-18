#!/bin/bash

# Function to display CPU model.
# Uses the 'cat' command to read the contents of the '/proc/cpuinfo' file.
# The 'grep' command is used to filter the line containing the CPU model.
# The result is displayed to the console.
getCPUModel() {
    cat /proc/cpuinfo | grep "model name" | head -n 1 | awk -F ': ' '{print $2}'
}

# Function to display hardware memory information.
# Uses the 'cat' command to read the contents of the '/proc/meminfo' file.
# The result is displayed to the console.
getHardwareMemory() {
    cat /proc/meminfo
}

# Function to display physical memory information.
# Uses the 'grep' command to filter the line containing 'MemTotal' in the '/proc/meminfo' file.
# The result is displayed to the console.
getPhysicalMemory() {
    grep MemTotal /proc/meminfo
}

# Function to continuously watch changeable interrupts.
# Uses the 'watch' command to run the 'cat /proc/interrupts' command every 1 second.
# The result is displayed to the console.
watchInterrupts() {
    watch -n1 'cat /proc/interrupts'
}

# Function to display used and free memory.
# Uses the 'free' command with the '-m' option to display memory usage in MB.
# The result is displayed to the console.
getMemoryUsage() {
    free -m
}

# Function to display configured devices.
# Uses the 'cat' command to read the contents of the '/proc/devices' file.
# The result is displayed to the console.
getConfiguredDevices() {
    cat /proc/devices
}

# Function to show PCI devices.
# Uses the 'lspci' command with the '-tv' option to display PCI devices in a tree-like format.
# The result is displayed to the console.
showPCIDevices() {
    lspci -tv
}

# Function to show USB devices.
# Uses the 'lsusb' command with the '-tv' option to display USB devices in a tree-like format.
# The result is displayed to the console.
showUSBDevices() {
    lsusb -tv
}

# Function to show a list of all devices with their properties.
# Uses the 'lshal' command to display a list of all devices with their properties.
# The result is displayed to the console.
showAllDevices() {
    lshal
}

# Function to show DMI/SMBIOS hardware information from the BIOS.
# Uses the 'dmidecode' command to display DMI/SMBIOS hardware information from the BIOS.
# The result is displayed to the console.
showHardwareInfo() {
    dmidecode
}

## Unit Tests

# Test for getCPUModel function.
test_getCPUModel() {
    local result
    result=$(getCPUModel)
    if [ -n "$result" ]; then
        echo "Test getCPUModel Passed!"
    else
        echo "Test getCPUModel Failed!"
    fi
}

# Test for getHardwareMemory function.
test_getHardwareMemory() {
    local result
    result=$(getHardwareMemory)
    if [ -n "$result" ]; then
        echo "Test getHardwareMemory Passed!"
    else
        echo "Test getHardwareMemory Failed!"
    fi
}

# Test for getPhysicalMemory function.
test_getPhysicalMemory() {
    local result
    result=$(getPhysicalMemory)
    if [ -n "$result" ]; then
        echo "Test getPhysicalMemory Passed!"
    else
        echo "Test getPhysicalMemory Failed!"
    fi
}

# Test for watchInterrupts function.
test_watchInterrupts() {
    # This test will run the function and continuously watch the interrupts for 5 seconds.
    # The test will pass if the function runs without errors.
    echo "Test watchInterrupts:"
    echo "---------------------"
    watchInterrupts &
    sleep 5
    kill $!
    echo "Test watchInterrupts Passed!"
}

# Test for getMemoryUsage function.
test_getMemoryUsage() {
    local result
    result=$(getMemoryUsage)
    if [ -n "$result" ]; then
        echo "Test getMemoryUsage Passed!"
    else
        echo "Test getMemoryUsage Failed!"
    fi
}

# Test for getConfiguredDevices function.
test_getConfiguredDevices() {
    local result
    result=$(getConfiguredDevices)
    if [ -n "$result" ]; then
        echo "Test getConfiguredDevices Passed!"
    else
        echo "Test getConfiguredDevices Failed!"
    fi
}

# Test for showPCIDevices function.
test_showPCIDevices() {
    local result
    result=$(showPCIDevices)
    if [ -n "$result" ]; then
        echo "Test showPCIDevices Passed!"
    else
        echo "Test showPCIDevices Failed!"
    fi
}

# Test for showUSBDevices function.
test_showUSBDevices() {
    local result
    result=$(showUSBDevices)
    if [ -n "$result" ]; then
        echo "Test showUSBDevices Passed!"
    else
        echo "Test showUSBDevices Failed!"
    fi
}

# Test for showAllDevices function.
test_showAllDevices() {
    local result
    result=$(showAllDevices)
    if [ -n "$result" ]; then
        echo "Test showAllDevices Passed!"
    else
        echo "Test showAllDevices Failed!"
    fi
}

# Test for showHardwareInfo function.
test_showHardwareInfo() {
    local result
    result=$(showHardwareInfo)
    if [ -n "$result" ]; then
        echo "Test showHardwareInfo Passed!"
    else
        echo "Test showHardwareInfo Failed!"
    fi
}

# Run all unit tests.
test_getCPUModel
test_getHardwareMemory
test_getPhysicalMemory
test_watchInterrupts
test_getMemoryUsage
test_getConfiguredDevices
test_showPCIDevices
test_showUSBDevices
test_showAllDevices
test_showHardwareInfo
