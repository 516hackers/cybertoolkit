#!/bin/bash
# Masscan Wrapper - 516 Hackers Toolkit

set -e

LOG_DIR="../../logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/masscan_$(date +%Y%m%d_%H%M%S).log"

echo "[516] Masscan Wrapper - Starting mass port scanning" | tee -a "$LOG_FILE"

if ! command -v masscan &> /dev/null; then
    echo "Error: masscan not found. Install with:" | tee -a "$LOG_FILE"
    echo "  Kali: sudo apt install masscan" | tee -a "$LOG_FILE"
    echo "  Source: https://github.com/robertdavidgraham/masscan" | tee -a "$LOG_FILE"
    exit 1
fi

if [ $# -lt 1 ]; then
    echo "Usage: $0 <target> [ports]" | tee -a "$LOG_FILE"
    echo "Example: $0 192.168.1.0/24 1-1000" | tee -a "$LOG_FILE"
    exit 1
fi

TARGET=$1
PORTS=${2:-1-1000}
RATE=${3:-1000}

echo "[516] Scanning: $TARGET" | tee -a "$LOG_FILE"
echo "[516] Ports: $PORTS" | tee -a "$LOG_FILE"
echo "[516] Rate: $RATE packets/sec" | tee -a "$LOG_FILE"

masscan -p"$PORTS" "$TARGET" --rate="$RATE" | tee -a "$LOG_FILE"

echo "[516] Masscan completed" | tee -a "$LOG_FILE"
