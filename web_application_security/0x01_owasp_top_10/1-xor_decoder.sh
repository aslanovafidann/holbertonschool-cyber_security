#!/bin/bash
<<<<<<< HEAD
python3 -c "from base64 import b64decode; print(bytes(byte ^ 0x5f for byte in b64decode('$1'.replace('{xor}', ''))).decode('utf-8'))" 
=======
python3 -c "from base64 import b64decode; print(bytes(byte ^ 0x5f for byte in b64decode('$1'.replace('{xor}', ''))).decode('utf-8'))"
>>>>>>> 963f2028fdefbe01348535f7fafc2585e129415e
