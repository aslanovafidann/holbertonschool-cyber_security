#!/bin/bash
whois $1 | awk -F: '/Registrant|Admin|Tech/ {gsub(/^ +| +$/,"",$2); gsub(/,/, ""); print $1 "," $2}' > $1.csv
