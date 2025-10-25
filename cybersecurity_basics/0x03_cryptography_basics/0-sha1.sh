#!/bin/bash
# Script that hashes a given password using SHA-1 and stores it in 0_hash.txt

# $1 = first argument (the password)
echo -n "$1" | sha1sum | awk '{print $1}' > 0_hash.txt

