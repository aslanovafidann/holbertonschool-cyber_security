#!/bin/bash
domain=$1
subfinder -d "$domain" -silent | while read host; do
    ip=$(dig +short "$host" | head -n1)
    if [ -n "$ip" ]; then
        echo "$host,$ip"
    fi
done > "$domain.txt"
