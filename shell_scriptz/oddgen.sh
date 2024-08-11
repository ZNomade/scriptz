#!/bin/bash
# =============================================================================
# Author: [=Zac|ZNômade=]
# Creation Date: 2024-08-11
# Last Modified: 2024-08-11
# Version: 1.0
# License: None
#
# Description:
# This script generates odd random numbers between the values ​​1 and 99.
# The script will generate numbers for 7 seconds and display the final result after that time.
# The script can be used for simple draws.
#
# Usage:
# ./script_name.sh 
#
# Parameters:
# None
#
# Output:
# Displays an odd number between 1 and 99 after 7 seconds.
#
# Example Usage:
# ./script_name.sh
#
# Notes:
# Make sure you have the permissions for execution of script.
#
# =============================================================================

# Initializes the variable to store the generated odd number
odd_number=0

# Sets the loop execution time
end=$((SECONDS+7))

echo "Generating random odd numbers for 7 seconds..."

# Loop that runs for 7 seconds
while [ $SECONDS -lt $end ]; do
    # Generates a random number between 1 and 99
    random_number=$((RANDOM % 100))
    
    # Check if the number is odd
    if [ $((random_number % 2)) -ne 0 ]; then
        odd_number=$random_number
    fi
done

# Displays the last generated odd number
echo "Número ímpar gerado: $odd_number"
