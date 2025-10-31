#!/bin/bash
exiftool "$1" | grep -i 'Owner\|Creator\|Author' | awk -F': ' '{print $2}' > 0-mystery.txt
