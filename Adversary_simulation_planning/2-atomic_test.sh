#!/usr/bin/env bash
 
TECHNIQUE_ID="T1087.001"
TECHNIQUE_NAME="Local Account Discovery"
RESULTS_FILE="atomic_results.txt"
LOG_FILE="atomic_log.txt"
FLAG_FILE="stop_test.flag"
 
if [ -f "$FLAG_FILE" ]; then
    echo "stop_test.flag detected. Aborting simulation."
    echo "Remove the flag file to allow execution."
    exit 1
fi
 
START_TIME="$(date '+%Y-%m-%d %H:%M:%S')"
 
echo "MITRE ATT&CK Technique: ${TECHNIQUE_ID} - ${TECHNIQUE_NAME}"
echo "Start time: ${START_TIME}"
 
echo "[${START_TIME}] START - ${TECHNIQUE_ID} ${TECHNIQUE_NAME}" >> "$LOG_FILE"
 
echo "Running simulation..."
 
{
    echo "=== MITRE ATT&CK: ${TECHNIQUE_ID} - ${TECHNIQUE_NAME} ==="
    echo "=== Timestamp: ${START_TIME} ==="
    echo ""
    echo "--- /etc/passwd entries ---"
    cut -d: -f1 /etc/passwd
    echo ""
    echo "--- Local groups ---"
    cut -d: -f1 /etc/group
    echo ""
    echo "--- Current user ---"
    whoami
    echo ""
    echo "--- Logged-in users ---"
    who
} > "$RESULTS_FILE"
 
echo "Output saved to ${RESULTS_FILE}"
 
END_TIME="$(date '+%Y-%m-%d %H:%M:%S')"
echo "End time: ${END_TIME}"
 
echo "[${END_TIME}] END   - ${TECHNIQUE_ID} ${TECHNIQUE_NAME}" >> "$LOG_FILE"
 
echo "Simulation complete. Review ${LOG_FILE} for details."
 
