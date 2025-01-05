#!/bin/bash
# =============================================================================
# Author: [=Zac|ZNômade=]
# Creation Date: 2025-01-05
# Last Modified: 2025-01-05
# Version: 1.0
# License: None
#
# Description:
# This script checks the geolocalization of the provided IP address.
#
# Usage:
# ./geoip.sh 
#
#
# Output:
# Shows the geolocalization of the provided IP address.
#
# 
#
# Notes:
# Make sure you have the permissions for execution of script and the command 'jq' is installed in the system.
#
# To contribute to improving the script visit:
# https://github.com/ZNomade/scriptz/shell_scriptz
#
# Revision History:
# Version 1.0: 2025-01-05 - Initial version of the script.
#
# =============================================================================

# Check if jq is installed
if ! command -v jq &> /dev/null; then
    echo "jq is not installed. Installing..."
    sudo apt update && sudo apt install -y jq
fi

# Asks user for IP
echo -n "Enter the IP you want to locate: "
read ip_address

# Checks if IP was provided
if [ -z "$ip_address" ]; then
    echo "No IP provided. Exiting..."
    exit 1
fi

# Makes a request to the ipinfo.io API
response=$(curl -s http://ipinfo.io/$ip_address/json)

# Check if there was an error in the request
if [ -z "$response" ]; then
    echo "Error getting IP information."
    exit 1
fi

# Displays the formatted result
echo "\nGeolocation Information for IP: $ip_address"
echo "$response" | jq 

# Note: The 'jq' command is used to format the output. Make sure 'jq' is installed for the script to work.
