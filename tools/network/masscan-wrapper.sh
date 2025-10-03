#!/bin/bash
# Masscan Wrapper - 516 Hackers Toolkit

set -e

LOG_DIR="../../logs"
mkdir -p "$LOG_DIR"
LOG_FILE="$LOG_DIR/masscan_$(date +%Y%m%d_%H%M%S).log"

{
echo "[516] Masscan Wrapper - Starting mass port scanning"

if ! command -v masscan &> /dev/null; then
    echo "Error: masscan not found. Install with:"
    echo "  Kali: sudo apt install masscan"
    echo "  Source: https://github.com/robertdavidgraham/masscan"
    exit 1
fi

if [ $# -lt 1 ]; then
    echo "Usage: $0 <target> [ports]"
    echo "Example: $0 192.168.1.0/24 1-1000"
    exit 1
fi

TARGET=$1
PORTS=${2:-1-1000}
RATE=${3:-1000}

echo "[516] Scanning: $TARGET"
echo "[516] Ports: $PORTS"
echo "[516] Rate: $RATE packets/sec"

masscan -p"$PORTS" "$TARGET" --rate="$RATE"

echo "[516] Masscan completed"
} | tee -a "$LOG_FILE"
