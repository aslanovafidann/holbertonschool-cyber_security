#!/bin/bash
salt=$(openssl rand -base64 12 | head -c 16); echo -n "$1$salt" | openssl dgst -sha512 | awk '{print $2}' > 3_hash.txt
