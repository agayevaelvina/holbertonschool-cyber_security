#!/bin/bash

# Check if argument is passed
if [ -z "$1" ]; then
    echo "Usage: $0 {xor}Base64EncodedString"
    exit 1
fi

# Remove the "{xor}" prefix
encoded="${1#\{xor\}}"

# Decode the Base64 string
decoded=$(echo "$encoded" | base64 -d 2>/dev/null)

if [ -z "$decoded" ]; then
    echo "Invalid Base64 string"
    exit 1
fi

# Try all possible XOR single-byte keys (0-255)
for key in $(seq 0 255); do
    result=""
    for (( i=0; i<${#decoded}; i++ )); do
        char=$(printf "%d" "'${decoded:$i:1}")
        xor_char=$(( char ^ key ))
        result+=$(printf "\\x%02x" "$xor_char")
    done

    # Convert hex output to ASCII
    decoded_text=$(echo -ne "$result")

    # Optional: You can check for printable ASCII only
    if [[ "$decoded_text" =~ ^[[:print:]]+$ ]]; then
        echo "$decoded_text"
        exit 0
    fi
done

# If no key succeeded
echo "Failed to decode XOR string"
exit 1
