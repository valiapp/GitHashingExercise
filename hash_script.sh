#!/bin/bash

# check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <4-digit-integer>"
    exit 1
fi

# check if the argument is a 4-digit integer
if ! [[ $1 =~ ^[0-9]{4}$ ]]; then
    echo "Error: Please provide a 4-digit integer as input."
    exit 1
fi

# input 4-digit integer
input_integer=$1

# hash the input using SHA-256
hashed_output=$(echo -n "$input_integer" | sha256sum | awk '{print $1}')

# save the output to hash_output.txt
echo "$hashed_output" > hash_output.txt
echo "SHA-256 hashed output: $hashed_output"
echo "SHA-256 hash of $input_integer saved to hash_output.txt"
