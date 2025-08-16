#!/bin/bash
whois $1 | awk -F: '/Registrant|Admin|Tech/ {field=$1; gsub(/^ +| +$/,"",$2); print field "," $2}' > $1.csv
